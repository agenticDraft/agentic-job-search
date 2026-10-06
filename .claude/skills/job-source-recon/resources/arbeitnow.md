# arbeitnow

- **Link:** https://www.arbeitnow.com/api/job-board-api
- **Tip:** javni JSON API, bez filtera u URL-u (parametar `?search=` se tiho ignoriše)
- **Prozor:** poslednjih 7 dana (`prozorDana`), filter u kodu po `postedAt` (`PROZOR_DANA` u `src/config.mjs`)
- **Kod:** `src/search/arbeitnow.mjs`, konstante `ARBEITNOW_API` i `ARBEITNOW_HOST` u `src/config.mjs`
- **Zamke:** vraća i sestrinske sajtove (`.fr`, `.co.uk`) — nemačko tržište je samo `.com`; 429 oko 10. strane
- **Izmereno:** `docs/PLAN-automatizacije.md`, Dodatak A

## Test prozora od 5 dana — 06.10.2026

`node run.mjs --dry --izvori=arbeitnow` (van sandboxa; `fetch failed` unutar njega)

- `postedAt` popunjen na 64 od 64 oglasa koja su stigla do izveštaja (najstariji 01.10, najnoviji 06.10)
- prikupljeno posle prozora: 2087 → u struci 80 → novo 64 → prošlo blokere 11, za proveru 53
- pun opis stiže u listi: 64 od 64 imaju opis, medijana 4262 znaka (min 1344, max 11628); poseban zahtev za detalj nije potreban
- brojka „pre prozora" nije zabeležena (log linija `prozor 5 dana: X → Y` je isečena iz izlaza)
