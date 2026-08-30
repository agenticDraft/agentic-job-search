# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Šta je ovo

Zoranov lični radni prostor za traženje posla (senior/lead front-end, full remote, nemačko
tržište). Nije softverski proizvod. Dve polovine koje rade zajedno:

- **`job-search-automation/`** — Node pipeline koji prikuplja oglase i filtrira ih
- **`.claude/skills/`** — skillovi koji ocenjuju oglase i pišu tekst (cover letter, profil, postovi)

Nije git repo, nema `package.json`, nema `node_modules`, nema testove. Čist Node ESM
(v24, `node:` moduli + ugrađen `fetch`).

**Jezik:** automatizacija (kod, komentari, identifikatori, `job-match` i `job-source-recon`
skillovi) je na srpskom bez dijakritike u kodu. `cover-letter`, `linkedin-post` i
`optimize-profile` su na engleskom, jer proizvode engleski tekst. Poštuj zatečeni jezik
fajla koji menjaš.

## Komande

Sve iz `job-search-automation/`:

```bash
node run.mjs --dry                  # pun prolaz bez ijednog upisa — POKRENI PRVO
node run.mjs                        # pun prolaz, piše fajlove i seen.json (1–2 min)
node run.mjs --podesavanja          # pokaži šta je pročitano iz podesavanja.json i stani
node run.mjs --provera              # duplirane vrednosti u projektu; exit 1 ako nađe
node run.mjs --izvori=remotely      # samo određeni izvori (arbeitnow, remotely, workwise)
node run.mjs --all                  # preskoči filter struke
node run.mjs --max-pages=2          # skrati arbeitnow prolaz
node run.mjs --dry --from-raw=data/raw/arbeitnow-<datum>.json.gz   # ponovi nad snimkom
```

**Dedupe se proverava samo preko `--from-raw`**, nikad ponovljenim mrežnim pozivom — izvor
je živ i vremenski sortiran, pa paginacija nije atomska i drugi prolaz legitimno nađe nove
stavke. Ispravan rezultat nad istim snimkom: `NOVO 0`.

Poništavanje prolaza (generisani fajlovi nose marker `Prikupljeno automatski`):

```bash
find novi-oglasi proveriti -name '*.md' -type f -exec grep -q "Prikupljeno automatski" {} \; -delete
```

Render cover lettera (iz korena; traži `pandoc` + `typst` iz Homebrew-a):

```bash
pandoc "linkedIn/prijave/<n>.<Firma> - Cover letter.md" \
  --pdf-engine=typst --template=.claude/skills/cover-letter/letter.typ \
  -o "linkedIn/prijave/<n>.<Firma> - Cover letter.pdf"
pdfinfo "<isti>.pdf" | grep Pages     # mora biti Pages: 1
```

## Arhitektura pipeline-a

`run.mjs` je orkestrator; svaka faza je jedan modul u `src/`:

1. **ingest** — `src/ingest/{arbeitnow,remotely,workwise}.mjs`, svaki vraća `{ jobs, raw }`.
   Rade na golom `fetch`-u; browser treba samo za izviđanje novog izvora (skill
   `job-source-recon`). Sirov snimak ide u `data/raw/<izvor>-<datum>.json.gz` (gzip jer je
   nekomprimovano ~24 MB dnevno).
2. **normalize** — `src/normalize.mjs`, svi izvori u isti oblik + `companyToken`.
3. **filter struke** — regex iz `podesavanja.json` (`struka.naslov`, `struka.tagovi`).
   **Nije tvrdi bloker**, samo izbacuje oglase van profesije.
4. **dedupe** — `src/dedupe.mjs`. Dva ključa: tvrdi iz URL-a (`an:`, `rm:`, `ww:`, `li:`) i
   meki `firma + normalizovan naslov`, jer isti oglas sa dva izvora ima dva URL-a.
5. **blokeri + rang** — `src/blockers.mjs` (7 pravila, samo ona sa strane oglasa),
   `src/rank.mjs` (težine za sortiranje, **ne ocena**).
6. **upis** — `src/dossier.mjs` piše `.md` dosijee; izveštaj prolaza u `data/prolaz-<datum>.json`.

`src/config.mjs` drži putanje i učitava `podesavanja.json` sa fallback difoltima.
`src/provera.mjs` je konzistentnost-čeker za `--provera`.

### Granica koju kod ne sme da pređe

**Pipeline ne ocenjuje.** Ne daje procenat, ne piše u `prijave/` ni `odbaceni/`. Ocenu daje
skill `job-match`, u razgovoru sa Zoranom. Rupe na strani kandidata (React, testovi, canvas)
kod sme samo da **imenuje** — `job-match` korak 3 zahteva da se za njih pita, a to kod ne može.

## Folderi i šta znače

Automatizacija piše u `job-search-automation/`:

- `novi-oglasi/<n>.<Firma>.md` — prošlo sve blokere, spremno za `job-match`
- `proveriti/<Firma> - <naslov>.md` — palo na bloker, sa navedenim dokazom. **Nije odbačeno** —
  ime je namerno takvo, jer lažni pozitivac vidiš i vratiš, a propušten oglas ne vidiš nikad
- `prijave/`, `odbaceni/` — lokalno prazni; prava istorija je u `linkedIn/`

Ocenjivanje radi u `linkedIn/` (nasleđeno, i dalje aktuelno):

- `linkedIn/novi-oglasi/` → `linkedIn/prijave/` ili `linkedIn/odbaceni/`
- **Verdikt nosi folder, a ne ime fajla.** Nema `-match`/`-no-match` sufiksa (promenjeno
  31.07.2026; stariji fajlovi sa sufiksom su zatečeno stanje, ne obrazac). Jedini sufiks u
  upotrebi je `-duplicate.md`.

Dedupe čita **oba** skupa foldera. Ako bi čitao samo lokalne, cela istorija ocena
(Recare, Hostaway, Genki, Helsing…) bi se vratila kao „novo".

## Jedna vrednost, jedan vlasnik

Prag plate je jednom stajao na osam mesta i sedam ih je tiho lagalo. Podela koja to rešava:

- **`job-search-automation/podesavanja.json`** drži **koliko** — jedino mesto gde broj stoji
  kao vrednost (`plata.pragEur`, termini struke, izvori)
- **`.claude/skills/job-match/candidate-profile.md` § Uslovi** drži **zašto** — JAEG po
  godinama, izvori, obrazloženja
- **sve ostalo pokazuje na jedno od ta dva i broj ne ponavlja**

`node run.mjs --provera` to nadgleda i prijavljuje ponavljanja sa `fajl:red`. Legitimni
izuzeci su u `src/provera.mjs`, svaki sa obrazloženjem. Kad dodaješ prag ili konstantu
negde u tekst — nemoj; pokaži na vlasnika.

`podesavanja.json` je Zoranov fajl: kod ga **čita, nikad ne prepisuje**. Ključevi koji
počinju sa `_` su komentari. Ako fali ili je pokvaren, radi se sa difoltima iz `config.mjs`
i to se glasno prijavljuje na početku prolaza.

## Skillovi u `.claude/skills/`

- **`job-match`** — ocenjuje oglas. Ima obavezan korak: *nijedna rupa iz profila ne obara
  ocenu dok se Zoran ne pita za nju*. Razlikuje bloker na strani oglasa (odbaci bez pitanja)
  od rupe na strani kandidata (moraš pitati). Svaki odgovor se upisuje u `candidate-profile.md`.
- **`cover-letter`** — piše pismo iz konkretnog oglasa i renderuje jednostrani PDF preko
  pandoc+typst. `initiativbewerbung.md` za firme bez otvorenog oglasa.
- **`cv-sync`** — pravi CV varijantu za konkretnu prijavu: uzima master CV za izabrani
  track i ubacuje doslovne termine iz oglasa za ono što CV **već tvrdi**. Ne dodaje nove
  tvrdnje; rupa ide na pitanje Zoranu, isto kao u `job-match` koraku 3. Zove ga
  `cover-letter` u svom honesty koraku, ne poziva se direktno.
- **`optimize-profile`**, **`linkedin-post`** — LinkedIn profil i postovi; `linkedin-post`
  § Voice je zajednička referenca za ton u svim tekstovima.
- **`job-source-recon`** — izviđa nov izvor oglasa i uvezuje ga u pipeline.

**Dva master CV-a, jedan track po oglasu.** `assets/Zoran Markovic CV - Frontend - design.md`
i `assets/Zoran Markovic CV - AI Automation SDLC - design.md`; oba se renderuju kroz
`assets/cv.typ`. Koji se uzima bira `job-match` korak 5 i upisuje u fajl oglasa kao
liniju `**Track:** <ime> — <razlog>`, od početka reda. `cover-letter` i `cv-sync` je
traže markerom (`grep '\*\*Track:\*\*'`), bilo gde u fajlu — naslov sekcije nije bitan.

Podržavajući fajlovi koje skillovi čitaju: `assets/linkedIn-aboutMe.md`,
`job-match/calibration.md` (obrazloženja ranijih ocena, uključujući greške u ocenjivanju).

## Ostali folderi

- `learning-plan/` — šta Zoran treba da nauči pre intervjua, prioritizovano po rupama iz oglasa
- `istrazivanje-trziste/` — **odvojen projekat**: istraživanje IT tržišta u Srbiji, nema veze
  sa pipeline-om za oglase
- `assets/` — CV, sertifikati, reference letter, About tekst
- `.playwright-mcp/`, `.history/` — artefakti alata, ne diraj

## Ako nešto pukne

- **`fetch failed`** — arbeitnow nije na sandbox allowlisti. Pokreni van sandboxa ili dodaj
  host preko `/sandbox`.
- **Prolaz stane rano uz 429** — izvor je ograničio; izveštaj to kaže na kraju. Pokreni ponovo.
- **`prikupljeno` znatno ispod uobičajenog** — prolaz nije stigao do kraja, isto rešenje.
