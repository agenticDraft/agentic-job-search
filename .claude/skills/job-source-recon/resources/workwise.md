# workwise.io

- **Link sa filterom:** _nalepi ovde ceo URL sa `search_id=`_ (u `podesavanja.json` → `izvori.workwise.pretrage` je trenutno prazno)
- **API:** https://search.workwise.io/v2/searches
- **Tip:** sačuvana pretraga na njihovom sajtu; remote i plata dolaze kao polja, ne kao tekst
- **Prozor:** poslednjih 7 dana, filter u kodu po `postedAt`
- **Kod:** `src/search/workwise.mjs`, `WORKWISE` u `src/config.mjs`
- **Zamke:** pretraga mora biti „Frontend Entwickler" + pun remote; stara pretraga „Softwareentwickler" + `partially_wanted` dala je 73 od 85 ne-remote oglasa
- **Izmereno:** `docs/PLAN-automatizacije.md`, Dodatak A
