# jobgether.com

- **Link:** https://jobgether.com/api/v1/jobs
- **Tip:** javni API za agente (dokumentacija na `/astroapi/ai/jobs/docs`, dozvoljen u robots.txt), daje ime pravog poslodavca
- **Upit:** `locations` + ključna reč po upitu; vrednosti u `podesavanja.json` → `izvori.jobgether`
- **Prozor:** poslednjih 7 dana, filter u kodu po `postedAt`
- **Kod:** `src/search/jobgether.mjs`, `JOBGETHER` u `src/config.mjs`
- **Zamke:** plafon 25 × 10 strana = 250 po upitu; `Crawl-delay: 2`; nepoznat slug lokacije daje 400; filter struke se ne primenjuje
- **Izmereno:** `docs/PLAN-automatizacije.md`, Dodatak A
