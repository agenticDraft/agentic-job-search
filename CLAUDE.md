# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Šta je ovo

Zoranov lični radni prostor za traženje posla (senior/lead front-end, full remote, nemačko
tržište). Nije softverski proizvod. Dve polovine koje rade zajedno:

- **`job-search-automation/`** — Node pipeline koji prikuplja oglase i filtrira ih
- **`.claude/skills/`** — skillovi koji ocenjuju oglase i pišu tekst (cover letter, profil, postovi)

Git repo, ali bez `package.json`, `node_modules` ili testova. Čist Node ESM (v24, `node:`
moduli + ugrađen `fetch`), bez ijedne zavisnosti — zato `src/html.mjs` ručno vadi JSON-LD
i blokove iz HTML-a umesto DOMParser-a.

**`docs/`, `job-search-automation/`, `job-search-manual/`, `assets/` i `linkedIn-posts/`
su u `.gitignore`** — to je Zoranova privatna radna građa (oglasi, prijave, CV, postovi,
plan automatizacije) i namerno ne ide u repo. U gitu se prate samo `.claude/`,
`CLAUDE.md`, `README.md`, `LICENSE` i `.gitignore`.

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
node run.mjs --izvori=remotely      # samo određeni izvori (arbeitnow, remotely, workwise, jobgether, arbeitsagentur, linkedin-mail-jobs)
node run.mjs --prozor=7             # samo oglasi objavljeni u poslednjih N dana (difolt 7, `prozorDana` u podesavanja.json; 0 = svi)
node run.mjs --struka               # uključi filter struke (difolt: isključen, samo prikupljamo)
node run.mjs --max-pages=2          # skrati arbeitnow prolaz
node run.mjs --dry --from-raw=data/raw/arbeitnow-<datum>.json.gz   # ponovi nad snimkom
```

`--from-raw` zna `arbeitnow`, `linkedin-mail-jobs` i `jobgether` snimke (remotely i workwise
nemaju replay). **`--dry` ipak upisuje `data/prolaz-<datum>.json`** — ne dira dosijee ni
`seen.json`, ali pregazi današnji izveštaj prolaza.

**Dedupe se proverava samo preko `--from-raw`**, nikad ponovljenim mrežnim pozivom — izvor
je živ i vremenski sortiran, pa paginacija nije atomska i drugi prolaz legitimno nađe nove
stavke. Ispravan rezultat nad istim snimkom: `NOVO 0`.

Poništavanje prolaza (generisani fajlovi nose marker `Prikupljeno automatski`):

```bash
find arbeitnow remotely workwise jobgether linkedin-mail-jobs arbeitsagentur -name '*.md' -type f -exec grep -q "Prikupljeno automatski" {} \; -delete
```

Render cover lettera (iz korena; traži `pandoc` + `typst` iz Homebrew-a):

```bash
pandoc "job-search-manual/prijave/<n>.<Firma> - Cover letter.md" \
  --pdf-engine=typst --template=.claude/skills/cover-letter/letter.typ \
  -o "job-search-manual/prijave/<n>.<Firma> - Cover letter.pdf"
pdfinfo "<isti>.pdf" | grep Pages     # mora biti Pages: 1
```

> **Istorija putanja:** ručni folder se zvao `linkedIn/`, pa `job-feed/`, a od 28.09.2026
> je `job-search-manual/`. Pipeline je bio pod `docs/job-search-automation/`, sad je u
> korenu kao `job-search-automation/`. `config.mjs` i skillovi su usklađeni sa novim
> putevima. Ako negde naiđeš na `linkedIn/...`, `job-feed/...` ili
> `docs/job-search-automation/...`, to je zaostatak — ispravi ga.

## Arhitektura pipeline-a

`run.mjs` je orkestrator; svaka faza je jedan modul u `src/`:

1. **search** — `src/search/{arbeitnow,remotely,workwise,jobgether,arbeitsagentur}.mjs`, svaki vraća `{ jobs, raw }`.
   Rade na golom `fetch`-u; browser treba samo za izviđanje novog izvora (skill
   `job-source-recon`). Sirov snimak ide u `data/raw/<izvor>-<datum>.json.gz` (gzip jer je
   nekomprimovano ~24 MB dnevno). Izuzetak je `src/search/linkedin-mail-jobs.mjs`: ne radi
   `fetch`, nego parsira mejlove koje skill `linkedin-mail-jobs` preda kroz `--from-raw`, i
   daje stubove bez punog opisa.
   **Prozor objave** (`prozorDana`, difolt 7) važi za sve izvore.
2. **normalize** — `src/normalize.mjs`, svi izvori u isti oblik + `companyToken`.
3. **filter struke** — samo uz `--struka`: regex iz `podesavanja.json` (`struka.naslov`,
   `struka.tagovi`). **Difolt je isključen**: pipeline samo prikuplja, ocenu daje `job-match`.
   **Nije tvrdi bloker**, samo izbacuje oglase van profesije.
4. **dedupe** — `src/dedupe.mjs`. Dva ključa: tvrdi iz URL-a (`an:`, `rm:`, `ww:`, `li:`, `jg:`) i
   meki `firma + normalizovan naslov`, jer isti oglas sa dva izvora ima dva URL-a.
5. **blokeri + rang** — `src/blockers.mjs` (6 pravila — `remote`, `architect`,
   `aem-backend`, `nivo`, `zakljucano`, `ugovor` — samo ona sa strane oglasa),
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

**Pravilo: folder po izvoru** (od 06.10.2026), da se iz foldera vidi odakle oglas dolazi.
`<izvor>` je tačno `job.source`: `arbeitnow`, `remotely`, `workwise`, `jobgether`,
`linkedin-mail-jobs`, `arbeitsagentur`. Spisak je `IZVORI` u `config.mjs`.

- `<izvor>/<n>.<Firma> - <datum>.md` — prošlo sve blokere, spremno za `job-match`
  (`<datum>` = dan prolaza u kom je oglas nađen)
- `<izvor>/proveriti/<Firma> - <naslov> - <datum>.md` — palo na bloker, sa navedenim dokazom. **Nije odbačeno** —
  ime je namerno takvo, jer lažni pozitivac vidiš i vratiš, a propušten oglas ne vidiš nikad
- `stari-oglasi/{novi-oglasi,proveriti}/` — stari zajednički folderi, više se u njih ne piše,
  ali dedupe ih čita (inače bi se 188 starih oglasa vratilo kao „novo")
- `prijave/`, `odbaceni/` — lokalno prazni; prava istorija je u `job-search-manual/`

Ocenjivanje radi u `job-search-manual/` (nasleđeno od bivših `linkedIn/` i `job-feed/`):

- `job-search-manual/novi-oglasi/` → `job-search-manual/prijave/` ili `job-search-manual/odbaceni/`
- **Verdikt nosi folder, a ne ime fajla.** Nema `-match`/`-no-match` sufiksa (promenjeno
  31.07.2026; stariji fajlovi sa sufiksom su zatečeno stanje, ne obrazac). Jedini sufiks u
  upotrebi je `-duplicate.md`.

Dedupe čita **oba** skupa foldera preko `LEGACY_DIRS` u `config.mjs`, koji pokazuje na
`job-search-manual/{novi-oglasi,prijave,odbaceni}`. Da čita samo lokalne, istorija ocena
(Recare, Hostaway, Genki, Helsing…) bi se vratila kao „novo".

## Jedna vrednost, jedan vlasnik

Prag plate je jednom stajao na osam mesta i sedam ih je tiho lagalo. Od 07.08.2026 plata
više uopšte ne filtrira oglase u pipeline-u — `plata.pragEur` je uklonjen iz
`podesavanja.json` (fajl to eksplicitno komentariše, ne vraćaj ga). Ono što ostaje kao
princip:

- **`job-search-automation/podesavanja.json`** drži **koliko**, za sve što pipeline
  stvarno filtrira — jedino mesto gde takav broj stoji kao vrednost (termini struke, izvori)
- **`.claude/skills/job-match/candidate-profile.md` § Uslovi** drži **zašto** — uključujući
  broj za `Gehaltsvorstellung` (JAEG po godinama, izvori, obrazloženja), koji pipeline više
  ne čita nego ga Zoran ručno unosi u prijave
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
  § Voice je zajednička referenca za ton u svim tekstovima. Novi postovi idu u
  `linkedIn-posts/<n>-post.md`.
- **`job-source-recon`** — izviđa nov izvor oglasa i uvezuje ga u pipeline.
- **`linkedin-mail-jobs`** — čita LinkedIn job-alert mejlove preko Gmail MCP-a (LinkedIn se ne
  skrejpuje direktno), dopunjava pun opis oglasa sa sajta firme/ATS-a, i gura ih u isti
  pipeline preko `--izvori=linkedin-mail-jobs --from-raw=...`.

**Dva master CV-a, jedan track po oglasu.** `assets/Zoran Markovic CV - Frontend - design.md`
i `assets/Zoran Markovic CV - AI Automation SDLC - design.md`; oba se renderuju kroz
`assets/cv.typ`. Koji se uzima bira `job-match` korak 5 i upisuje u fajl oglasa kao
liniju `**Track:** <ime> — <razlog>`, od početka reda. `cover-letter` i `cv-sync` je
traže markerom (`grep '\*\*Track:\*\*'`), bilo gde u fajlu — naslov sekcije nije bitan.

Podržavajući fajlovi koje skillovi čitaju: `assets/linkedIn-aboutMe.md`,
`job-match/calibration.md` (obrazloženja ranijih ocena, uključujući greške u ocenjivanju).

## Ostali folderi

- `docs/PLAN-automatizacije.md` — plan automatizacije (Dodatak A: izmereni izvori);
  čitaju ga `job-source-recon` i `linkedin-mail-jobs`
- `docs/istrazivanje-trziste/` — **odvojen projekat**: istraživanje IT tržišta u Srbiji,
  nema veze sa pipeline-om za oglase
- `docs/drafts/`, `docs/superpowers/` — radne beleške i planovi/specifikacije, ne
  referenciraju ih skillovi
- `assets/` — CV, sertifikati, reference letter, About tekst
- `linkedIn-posts/` — objavljeni LinkedIn postovi (`<n>-post.md`)
- `.playwright-mcp/`, `.history/` — artefakti alata, ne diraj

## Ako nešto pukne

- **`fetch failed`** — arbeitnow nije na sandbox allowlisti. Pokreni van sandboxa ili dodaj
  host preko `/sandbox`.
- **Prolaz stane rano uz 429** — izvor je ograničio; izveštaj to kaže na kraju. Pokreni ponovo.
- **`prikupljeno` znatno ispod uobičajenog** — prolaz nije stigao do kraja, isto rešenje.
