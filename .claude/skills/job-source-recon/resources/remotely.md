# remotely.de

- **Link:** https://www.remotely.de/remote-jobs/bereich/computer-software
- **Tip:** HTML lista + JSON-LD na detalju (samo na delu oglasa, treba fallback)
- **Paginacija:** radi samo putanja `/seite/N`, ne `?seite=`
- **Prozor:** poslednjih 7 dana, filter u kodu po `postedAt`
- **Kod:** `src/search/remotely.mjs`, `REMOTELY` u `src/config.mjs`; kategorije u `podesavanja.json` → `izvori.remotely.kategorije`
- **Zamke:** koristi se isključivo `/remote-jobs/`; `/home-office-jobs/` je skoro 100% hybrid
- **Izmereno:** `docs/PLAN-automatizacije.md`, Dodatak A
