---
name: job-source-recon
description: Izviđa nov izvor oglasa za posao i uvezuje ga u job-search-automation pipeline. Koristi kad Zoran nalepi link ka job board-u sa podešenim filterom (Indeed, remotely.de, workwise, StepStone, Xing, LinkedIn…) i pita da li mu se može pristupiti, da li se mogu pročitati oglasi, ili traži da se taj izvor doda u automatizaciju — uključujući izvore koji traže login, gde se izviđa kroz njegov Chrome (Claude in Chrome).
---

# Izviđanje novog izvora oglasa

Zoran daje URL sa **već podešenim filterom**. Posao je: doći do punog teksta svakog oglasa,
pa ga provući kroz postojeći pipeline. Ne praviti nov pipeline.

**Pročitaj pre početka:** `docs/PLAN-automatizacije.md`, Dodatak A —
tamo su izmereni rezultati za arbeitnow, Indeed, remotely.de i workwise.
Ako je izvor već tamo, nema izviđanja, samo se koristi zapisano.

## Linkovi izvora — `resources/<izvor>.md`

Link ka svakom izvoru (sa filterom, ako ga ima) živi u `resources/<izvor>.md`, uz tip
izvora, zamke i pokazivač na kod. Pre izviđanja pogledaj da li fajl već postoji; za nov
izvor napravi `resources/<izvor>.md` istog oblika. Pipeline ove fajlove **ne čita** — link
za rad je i dalje u `config.mjs`/`podesavanja.json`, pa pri promeni ažuriraj oba mesta.

Svaki izvor se čita sa prozorom od poslednjih 7 dana (`prozorDana` u `podesavanja.json`,
`PROZOR_DANA` u `config.mjs`, `--prozor=N` privremeno, `0` = bez prozora). Prozor se
primenjuje u kodu po `postedAt`, ne parametrom u URL-u, jer sajtovi parametre tiho
ignorišu. Zato novi `search/<izvor>.mjs` mora da popuni `postedAt` kad izvor daje datum objave.

**Filter struke je isključen** (uključuje se samo sa `--struka`): ovde se samo prikuplja.
Izbor struke je već u filterima izvora, a ocenu daje `job-match` kasnije.

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

### Izvor iza login-a — Claude in Chrome

Playwright otvara čist profil, pa na login stane. Zoranov Chrome ima njegovu sesiju
(StepStone, Xing, Indeed nalog). Kad korak 1 pokaže login zid, pređi na
`mcp__claude-in-chrome__*` — isti obrazac, druga imena:

```
tabs_context_mcp, pa tabs_create_mcp  → uvek nov tab, ne Zoranov postojeći
navigate                               → URL sa filterom
javascript_tool                        → fetch() iz konteksta strane, pa DOMParser
read_network_requests                  → interni XHR
```

`javascript_tool` nema `filename:` — vrati sažetak (broj, ID-eve, 2–3 primerka), ne ceo
rezultat. Ne klikći ništa što otvara `alert`/`confirm`: dijalog blokira ekstenziju dok ga
Zoran ručno ne zatvori. Ako ekstenzija ne odgovara ili sajt nema dozvolu u ekstenziji,
stani i reci Zoranu — ne vraćaj se tiho na Playwright.

**Chrome je samo za otkrivanje, i to jače nego inače.** Pipeline je Node bez nadzora i
nikad ne dobija Zoranove kolačiće ni sesiju. Zato je pitanje izviđanja iza login-a uvek:
**postoji li put do istih podataka bez login-a?** Proveri, ovim redom:

- javni API ili XHR koji radi i iz odjavljenog prozora (`curl` iz Node-a bez kolačića)
- javna strana pojedinačnog oglasa (JSON-LD) — login je često samo na listi
- alert mejl izvora, kao LinkedIn (PLAN §7) — ide kroz Gmail, ne kroz sesiju

Ako nijedno ne postoji, izvor **nije za pipeline**. Zapiši to u Dodatak A i stani.

## Postupak — 6 koraka, redom

```
- [ ] 1. Pristup
- [ ] 2. Gde su podaci
- [ ] 3. Paginacija — i provera da se poštuje
- [ ] 4. Ukupan broj
- [ ] 5. Pun tekst oglasa, na 2–3 primerka
- [ ] 6. Sanity na sadržaju, ne samo na broju
```

**1. Pristup.** `browser_navigate`. Prolazi li Cloudflare, traži li login. Login → pređi na
Chrome (§ Izvor iza login-a) i od koraka 2 radi tamo.

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
- **Parametar koji prihvata samo nekoliko vrednosti, ostale tiho ignoriše.** arbeitsagentur
  `veroeffentlichtseit`: važe 0, 1, 7, 14, 28; sa 5 vraća sve (350 umesto 35). Spec je tvrdio „0–100".
  Za svaki filter koji se prosleđuje proveri da broj rezultata stvarno pada.
- **`.click()` u petlji** ubija izvršni kontekst.
- **Dve paralelne taksonomije na istom sajtu.** remotely.de: `/home-office-jobs/` je 46/46
  hybrid, `/remote-jobs/` je stvarno remote. Ista kategorija, suprotan sadržaj.
- **Regex nad prozom traži kontekst.** „Hybrid Agility" nije režim rada, „on-site deployment"
  nije mesto rada, „B2B SaaS" nije tip ugovora. Ako izvor daje polje — koristi polje.

## Kako se izvor uvezuje

Novi fajl `job-search-automation/src/search/<izvor>.mjs`, koji izvozi
`fetch<Izvor>({ log })` i vraća `{ jobs, incomplete }`. Oblik `Job` je u `normalize.mjs`.

**Popuni `remoteStructured` i `salaryStructured` samo ako ih izvor stvarno ima kao podatak.**
Kad su `null`, blokeri padaju na regex. arbeitnow ih namerno ne postavlja — njegov `remote`
boolean je predfilter, ne podatak.

Zatim: dodaj konstante u `config.mjs`, uvezi u `run.mjs` pod novo ime u `--izvori`,
i **ne diraj** `blockers.mjs`, `rank.mjs`, `dedupe.mjs` ni `dossier.mjs` — oni su
izvor-agnostični i to je namerno.

**Pravilo: folder po izvoru.** Oglasi svakog izvora idu u `job-search-automation/<izvor>/`
(prošli blokere) i `job-search-automation/<izvor>/proveriti/` (pali na bloker), gde je
`<izvor>` tačno `job.source`. Tako se iz foldera vidi odakle oglas dolazi. `dossier.mjs`
to radi sam; jedino što novi izvor mora jeste da se upiše u `IZVORI` u `config.mjs`, jer
dedupe istoriju čita odatle. Filteri izvora (ono što je Zoran podesio u browseru) idu u
`podesavanja.json` → `izvori.<izvor>`, a mapiranje i zamke u `resources/<izvor>.md`.

## Pokretanje izvora — skill ovo radi sam

Kad je izvor uvezan (ili kad Zoran traži da se izvor pokrene/testira), pokreni prolaz,
nemoj samo opisati komande. Sve iz `job-search-automation/`:

1. `node run.mjs --podesavanja` — izvor mora da stoji kao ✓ i da pokaže svoje filtere.
2. **Suvi prolaz:** `node run.mjs --dry --izvori=<izvor>`. Pokaži levak. Node `fetch` ne
   prolazi kroz sandbox (`fetch failed`), pa ovu komandu pokreni sa
   `dangerouslyDisableSandbox: true` odmah, bez ponavljanja unutar sandboxa. `--dry`
   ipak pregazi `data/prolaz-<datum>.json`.
3. Proveri levak: `prikupljeno` posle prozora, da li je `postedAt` popunjen, i da je
   `posle filtera struke` isto kao `prikupljeno` (filter je isključen). Ako broj ne pada
   kad menjaš filter ili prozor, parametar se tiho ignoriše (v. Zamke).
4. **Pravi prolaz** `node run.mjs --izvori=<izvor>` — pisanje u `job-search-automation/<izvor>/`
   je ono zbog čega se izvor i pokreće, pa se radi bez dodatnog pitanja kad je suvi prolaz čist.
5. **Dedupe provera:** ponovi suvi prolaz; mora da pokaže `NOVO 0` i `folder: N`.
6. Upiši izmerene brojeve u `resources/<izvor>.md`.

Skill ne ocenjuje oglase: svi koji prođu dedupe ostaju u folderu izvora, a `job-match`
ih ocenjuje kasnije.

## Šta se NE radi

- **Ne zaobilaziti login i ne skrejpovati LinkedIn.** Za LinkedIn se koriste alert mejlovi
  (v. PLAN §7). Rizik od suspenzije naloga je Zoranova odluka, već doneta: ne. Važi i za
  Chrome — tu je rizik veći, jer radi na njegovom pravom nalogu.
- **Ne izvlačiti sesiju iz Chrome-a u pipeline.** Nema kopiranja kolačića ni tokena u
  `config.mjs`, `.env` ili skript. Izviđanje iza login-a je nekoliko pregleda strane, ne
  masovni prolaz: probaj paginaciju na 2 strane, pun tekst na 2–3 oglasa, i stani.
- **Ne ocenjivati oglase.** Izviđanje završava kad oglasi uđu u pipeline. Ocenu daje
  `job-match`, sa Zoranom.
- **Ne praviti zaseban skript van pipeline-a.** Dedupe i blokeri moraju ostati zajednički,
  inače isti oglas prolazi dvaput preko dva izvora.

## Na kraju

Dopuni **Dodatak A** u `PLAN-automatizacije.md`: šta je izvor dao, koje su zamke bile,
koliki je prinos kroz blokere. Sledeći izvor tako kreće od zapisanog, ne od nule.
