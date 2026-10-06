# arbeitsagentur.de (Bundesagentur für Arbeit — Jobsuche)

- **Link sa filterima (browser):** https://www.arbeitsagentur.de/jobsuche/suche?suchbereich=jobs&homeoffice=prozentual_100&arbeitszeit=vz&beruf=Softwareentwickler%2Fin&veroeffentlichtseit=7
- **API:** `GET https://rest.arbeitsagentur.de/jobboerse/jobsuche-service/pc/v6/jobs`, header `X-API-Key: jobboerse-jobsuche` (javni ključ iz bundesAPI/jobsuche-api)
- **Detalj oglasa:** `GET /pc/v4/jobdetails/{base64(referenznummer)}`, isti header. Pun opis je u polju `stellenangebotsBeschreibung`: 35 od 35 oglasa ga ima, 1315–7434 znaka (medijana 3800), provereno 06.10.2026.
- **Link oglasa:** `https://www.arbeitsagentur.de/jobsuche/jobdetail/<referenznummer>` — HTTP 200, sadržaj stranice nije proveren
- **Izlaz u pipeline-u:** `job-search-automation/arbeitsagentur/` (prošli blokere) i `arbeitsagentur/proveriti/` (pali na bloker)
- **Kod:** `src/search/arbeitsagentur.mjs`; filteri u `podesavanja.json` → `izvori.arbeitsagentur.filteri`

## Isti filteri kroz API (provereno 06.10.2026)

```
beruf=Softwareentwickler%2Fin
veroeffentlichtseit=7            # SAMO 0, 1, 7, 14, 28 — v. Zamke
arbeitszeit=vz
homeoffice=prozentual_100;nv_true
size=100&page=1
```

Mapiranje iz browser URL-a:
- `beruf`, `arbeitszeit`, `veroeffentlichtseit` — isti nazivi i značenje
- `homeoffice=prozentual_100` u browseru = „Homeoffice möglich" sa klizačem na 100 %, **uključujući** oglase bez procenta. U API-ju isti string sam daje samo oglase sa navedenih 100 % (1 oglas). Za browserov skup treba `prozentual_100;nv_true` (tačka-zarez).
- `was` je slobodan tekst i **ne** zamenjuje `beruf`; ne šalji ga ako hoćeš browserov skup
- `zeitarbeit` i `pav` su u API-ju „samo": `true` vraća samo Zeitarbeit/Personalvermittlung. Izostavi ih.
- `homeoffice` sa `nv_true` ili `nv_false` samostalno → greška `EINGABEN_UNV…` (odbijeno)

## Poređenje sa browserom (06.10.2026, ~15:30)

Browser: 34. API sa gornjim upitom: 35 (`maxErgebnisse`). Prvih 12 naslova i redosled se poklapaju. Razlika od 1 nije objašnjena (moguć novi oglas između dva merenja, nije proveren).

## Prolaz kroz skill — 06.10.2026 (prozor 7 dana, bez filtera struke)

37 u listi → 31 u prozoru → 2 već viđena → 29 novih → 16 prošlo blokere (`arbeitsagentur/`), 13 za proveru (`arbeitsagentur/proveriti/`). Ponovljen suvi prolaz: `NOVO 0`, `folder: 31`. Blokeri su oborili: `remote` 8, `nivo` 4, `architect` 1.

## Zamke

- **`veroeffentlichtseit` poznaje samo 0 (danas), 1, 7, 14, 28.** Svaka druga vrednost se tiho ignoriše i vraća sve: sa 5 stiže 350 oglasa umesto 35. Spec koji kaže „0–100" ovde laže. Ingest zato traži najmanji dozvoljeni prozor ≥ `PROZOR_DANA` (difolt 7, pa se šalje 7), a tačan rez radi filter po `postedAt`.
- Prvi puni prolaz 06.10.2026 (tada još sa filterom struke i prozorom od 5 dana): 35 u listi → 18 u prozoru → 2 u struci → 1 prošao blokere, 1 za proveru. Filter struke je skidao Java/SAP/C++ oglase, pa je od 06.10.2026 isključen po difoltu (uključuje se sa `--struka`). Prozor je od tada 7 dana, što je ujedno dozvoljena vrednost API-ja, pa je rez tačan.

- Lista je u `ergebnisliste`, ne `stellenangebote` kako piše spec; naslov je `stellenangebotsTitel`, firma `firma`, datum `veroeffentlichungszeitraum.von`, id `referenznummer`
- Rezultat sadrži i praktikume i Werkstudent oglase; filter struke u pipeline-u ih treba da skine
- `homeoffice=prozentual_100` ne znači „100 % remote" — 33 od 34 oglasa nema navedeni procenat
