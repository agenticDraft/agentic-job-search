---
name: job-source-recon
description: Izviđa nov izvor oglasa za posao i uvezuje ga u job-search-automation pipeline. Koristi kad Zoran nalepi link ka job board-u sa podešenim filterom (Indeed, remotely.de, workwise, StepStone, LinkedIn…) i pita da li mu se može pristupiti, da li se mogu pročitati oglasi, ili traži da se taj izvor doda u automatizaciju.
---

# Izviđanje novog izvora oglasa

Zoran daje URL sa **već podešenim filterom**. Posao je: doći do punog teksta svakog oglasa,
pa ga provući kroz postojeći pipeline. Ne praviti nov pipeline.

**Pročitaj pre početka:** `docs/PLAN-automatizacije.md`, Dodatak A —
tamo su izmereni rezultati za arbeitnow, Indeed, remotely.de i workwise.
Ako je izvor već tamo, nema izviđanja, samo se koristi zapisano.

## Alat

Za **izviđanje** — Playwright MCP. Kolačići, consent i hidracija rade same od sebe.
Za **rad** — čist Node `fetch`. Provereno 04.08.2026: remotely.de i workwise API rade iz
Node-a bez browsera. **Browser treba za otkrivanje, ne za pokretanje.**

Obrazac koji je radio na sva četiri izvora:

```
browser_navigate       → otvori URL sa filterom
browser_evaluate       → fetch() IZ KONTEKSTA STRANE, pa DOMParser
browser_network_requests → kad podaci nisu u HTML-u
```

`fetch` iz konteksta strane, a **ne** klik u petlji: klik ume da odnavigira i ubije izvršni
kontekst usred posla (desilo se na Indeed-u). Za velike rezultate koristi
`browser_evaluate` sa `filename:`.

## Postupak — 6 koraka, redom

```
- [ ] 1. Pristup
- [ ] 2. Gde su podaci
- [ ] 3. Paginacija — i provera da se poštuje
- [ ] 4. Ukupan broj
- [ ] 5. Pun tekst oglasa, na 2–3 primerka
- [ ] 6. Sanity na sadržaju, ne samo na broju
```

**1. Pristup.** `browser_navigate`. Prolazi li Cloudflare, traži li login.

**2. Gde su podaci.** Ovim redom, prvi pogodak pobeđuje:

- `script[type="application/ld+json"]` sa `@type: JobPosting` — najčistije
- `#__NEXT_DATA__` (Next.js) ili `window.__NUXT__`
- `browser_network_requests` sa filterom `(api|graphql|search|job)` — interni XHR
- HTML DOM — poslednja opcija

**3. Paginacija — i ODMAH provera.** Uporedi listu ID-eva strane 1 i strane 2.
**Ako je preklop 100%, parametar se ignoriše.** Palo dvaput: arbeitnow `?search=`,
remotely.de `?seite=`. Kod remotely.de radi samo putanja `/seite/N`.

**4. Ukupan broj.** „Seite X von Y (N Jobs)" ili `paging` iz API-ja. Bez toga se ne zna
da li je prolaz potpun. Ne zaustavljaj probu na svom sopstvenom limitu petlje —
tako je arbeitnow prvo izmeren kao 1.175 umesto 3.637.

**5. Pun tekst — na 2–3 oglasa, ne na jednom.** JSON-LD je bio samo na 11 od 50
remotely.de oglasa; ostalih 39 tražilo je fallback.

**6. Sanity na sadržaju.** Koliko je stvarno remote, koliko ima platu, jesu li to uopšte
front-end role. Broj oglasa ne znači ništa sam za sebe.

## Zamke — sve viđene, ne izmišljene

- **Parametar koji se tiho ignoriše** (`?search=`, `?seite=`, `?remote=true`). Uvek uporedi
  strane 1 i 2.
- **`<style>` unutar elementa curi u `textContent`** — styled-components. Na Indeed-u je ime
  firme vraćalo 1,5 KB CSS-a umesto „Boomi". Skini `<style>`/`<script>` pre čitanja.
- **JSON-LD nije na svim oglasima istog sajta.** Uvek napiši fallback.
- **`!ld` nije `!dostupno`.** Strana od 18 KB bez `JobPosting` LD-a i dalje ima ceo oglas.
  Zamalo je odbačen izvor koji daje 100% pokrivenost.
- **Lažne kartice u listi** (Indeed `456789abcdef0123`) vraćaju 404. Ne obarati ceo prolaz.
- **`.click()` u petlji** ubija izvršni kontekst.
- **Dve paralelne taksonomije na istom sajtu.** remotely.de: `/home-office-jobs/` je 46/46
  hybrid, `/remote-jobs/` je stvarno remote. Ista kategorija, suprotan sadržaj.
- **Regex nad prozom traži kontekst.** „Hybrid Agility" nije režim rada, „on-site deployment"
  nije mesto rada, „B2B SaaS" nije tip ugovora. Ako izvor daje polje — koristi polje.

## Kako se izvor uvezuje

Novi fajl `job-search-automation/src/ingest/<izvor>.mjs`, koji izvozi
`fetch<Izvor>({ log })` i vraća `{ jobs, incomplete }`. Oblik `Job` je u `normalize.mjs`.

**Popuni `remoteStructured` i `salaryStructured` samo ako ih izvor stvarno ima kao podatak.**
Kad su `null`, blokeri padaju na regex. arbeitnow ih namerno ne postavlja — njegov `remote`
boolean je predfilter, ne podatak.

Zatim: dodaj konstante u `config.mjs`, uvezi u `run.mjs` pod novo ime u `--izvori`,
i **ne diraj** `blockers.mjs`, `rank.mjs`, `dedupe.mjs` ni `dossier.mjs` — oni su
izvor-agnostični i to je namerno.

## Šta se NE radi

- **Ne zaobilaziti login i ne skrejpovati LinkedIn.** Za LinkedIn se koriste alert mejlovi
  (v. PLAN §7). Rizik od suspenzije naloga je Zoranova odluka, već doneta: ne.
- **Ne ocenjivati oglase.** Izviđanje završava kad oglasi uđu u pipeline. Ocenu daje
  `job-match`, sa Zoranom.
- **Ne praviti zaseban skript van pipeline-a.** Dedupe i blokeri moraju ostati zajednički,
  inače isti oglas prolazi dvaput preko dva izvora.

## Na kraju

Dopuni **Dodatak A** u `PLAN-automatizacije.md`: šta je izvor dao, koje su zamke bile,
koliki je prinos kroz blokere. Sledeći izvor tako kreće od zapisanog, ne od nule.
