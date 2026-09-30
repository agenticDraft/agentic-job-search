---
name: linkedin-mail
description: Čita nove LinkedIn job-alert mejlove preko Gmail MCP-a, traži pun opis oglasa na sajtu firme, i ubacuje ih u job-search-automation pipeline. Koristi kad Zoran kaže da proveriš LinkedIn alerte, kaže „proveri linkedin mejlove", ili pita ima li nečeg novog u alert mejlovima.
---
# LinkedIn alert mejlovi → pipeline

Dovršava Fazu 3 iz `docs/PLAN-automatizacije.md`: alert mejl daje samo
naslov, firmu, lokaciju i link. Ovaj skill dopunjava **pun tekst oglasa** pretragom sajta
firme, pa oglase gura u isti pipeline kao arbeitnow/remotely/workwise.

**LinkedIn se ne skrejpuje direktno** — razlog je u § 7 tog plana. Opis se uvek traži sa
sajta firme ili sa njihovog ATS-a (Greenhouse, Lever, Personio, SmartRecruiters, Ashby).

## Odakle mejlovi

Gmail MCP, ne skripta. Faza sa sopstvenim OAuth-om (`fetch-linkedin-mail.mjs`) je odložena —
potrebna je tek ako se ovo bude vrtelo iz crona, bez Claude sesije. Kad se doda, piše
**isti** `data/raw/linkedin-mail-<datum>.json`, pa se koraci ispod ne menjaju.

Pretraga: `from:jobalerts-noreply@linkedin.com newer_than:<N>d`. Prozor bira Zoran u
zahtevu, a **difolt je 1 dan**: poslednja 24 sata, ne kalendarski dan. Dnevni alerti
stižu u toku celog dana (28.09.2026 je stiglo 10, otprilike na svaka 2 sata), pa 1 dan
pokriva jedan ceo krug.

- „povuci mejlove“, „današnje“, bez vremena → `newer_than:1d`
- „od juče“, „od pre 3 dana“, „za poslednjih 5 dana“ → `newer_than:2d`, `3d`, `5d`
  (sve od tada do sad)
- jedan tačno određen dan („samo od 25.09.“) → `after:2026/09/25 before:2026/09/26`

Ako zahtev može da se pročita na dva načina („mejlovi od juče“ znači samo jučerašnje ili od
juče do danas?), uzmi širi prozor. Mejlovi koji su već u `data/gmail-seen.json` ionako se
preskaču (korak 3), pa preklapanje ne pravi duplikate. Kaži Zoranu koji si prozor uzeo.

**Nema `job-alerts` labele** u Zoranovom nalogu — ne traži je, alerti stoje u INBOX-u.

Svi alert mejlovi su digest: jedan mejl nosi ~6 oglasa. Naslov mejla imenuje samo prvi
oglas (`„Senior Fullstack Engineer - Custom Solutions at Staffbase"`), pa se po naslovu
ne sme zaključivati koliko ih je unutra.

## Bez filtera struke — `podesavanja.json` se ne koristi

Alerti su već filtrirani na LinkedIn-u: Zoran je sam podesio sačuvane pretrage (Senior
Frontend Developer, Automation Engineer, Generative AI Engineer, AI Transformation…). Svaki
oglas iz mejla je zato već „u struci" po njegovoj odluci.

Filter struke iz `podesavanja.json` (`struka.naslov`) je pisan za široke izvore
(arbeitnow, remotely, workwise) i pokriva samo front-end. Nad alertima bi izbacio sve
AI/automation role. Izmereno 28.09.2026: propustio je 5 od 38 oglasa, i to samo
front-end. Zato svaki prolaz ovog skilla ide sa **`--all`**. Ne predlaži izmenu
`podesavanja.json` da bi alerti prošli.

Dedupe i blokeri (`src/blockers.mjs`) ostaju. Oni ne čitaju `podesavanja.json` i
proveravaju stvarne uslove oglasa (remote, nivo, ugovor), ne profesiju.

## Koraci

1. **Povuci mejlove.** `search_threads` sa gornjim upitom, pa `get_message` sa
   `messageFormat: FULL_CONTENT` za svaki.

   Uzmi **`plaintextBody`, nikad `htmlBody`.** Izmereno 06.08.2026: plaintext 9,8 KB
   naspram HTML 169,7 KB, a plaintext već ima naslov/firmu/lokaciju u zasebnim redovima.
   `get_message` ionako prelije rezultat u fajl zbog veličine — tada radi `jq -r '.plaintextBody'` nad tim fajlom umesto da čitaš ceo JSON u kontekst.
2. **Isparsiraj.** `parseAlertMails` iz `src/ingest/linkedin-mail.mjs` — prima
   `[{ id, date, plaintextBody }]`, vraća jedinstvene stubove (dedupe po job ID-u, jer se
   dnevni alerti preklapaju). Upiši ih u `data/raw/linkedin-mail-<datum>.json`, gde je
   `<datum>` dan pokretanja, a ne dan mejlova. Ako fajl već postoji, jer je prolaz tog
   dana već rađen, dodaj nove stubove u njega (jedinstveno po `url`). Ne prepisuj ga,
   inače se gube stubovi i opisi iz ranijeg prolaza.

   Ako neki mejl ne da nijedan oglas, funkcija to prijavi kao upozorenje — to znači da je
   LinkedIn promenio šablon. Pokaži Zoranu upozorenje, ne prećuti ga.
3. **Zapamti obrađene mejlove** u `data/gmail-seen.json` (`message-id → ISO datum`), i na
   početku preskoči one koji su već tu. Isti fajl i isti oblik koje bi pisala OAuth skripta.
4. **Dopuni opis** — za svaki stub bez `description`:

   - WebSearch: `"<firma>" "<naslov>"`, pa varijanta bez navodnika ako prva ne nađe ništa.
   - WebFetch najverovatniji pogodak **sa sajta firme ili njihovog ATS-a** — ne
     linkedin.com, ne indeed/glassdoor/stepstone/freehire/arbeitsagentur agregator.
   - **WebFetch vraća sažetak, ne doslovan tekst** (prepričava ga manji model). Blokeri
     traže tačne reči (remote/hybrid/vor Ort, nivo, ugovor), pa je doslovan tekst bolji.
     Kad WebFetch da JS ljusku, 404 ili očigledno skraćen tekst: prvo curl ka ATS API-ju
     (Greenhouse `boards-api.greenhouse.io`, Lever `api.lever.co`, Ashby
     `api.ashbyhq.com`, Personio `*.jobs.personio.de/xml` — hostovi su na sandbox
     allowlisti u `.claude/settings.local.json`), pa
     Playwright: `browser_navigate` + `browser_evaluate` sa `document.body.innerText`,
     **bez** `filename` parametra (on piše u `.playwright-mcp/` u korenu repoa, koji se ne
     dira). Zatvori browser na kraju. Izmereno 28.09.2026: Playwright je izvukao 9 od 13
     oglasa na kojima je WebFetch pao (Ashby, Kenjo, NTT DATA, Personio).
   - **Pouzdan pogodak** (firma se poklapa, naslov se poklapa ili je očigledna varijanta,
     tekst ima dužinu i opisuje tu ulogu): upiši `description` (pun tekst) i
     `descriptionUrl` (odakle je uzet) u stub.
   - **Dvosmisleno** (više kandidata, ili se naslov/firma ne poklapaju tačno): pokaži
     Zoranu 2–3 kandidata — naslov, URL, kratak citat — i pitaj koji je pravi ili da se
     preskoči. **Ne biraj sam kad nisi siguran.**
   - **Nema pogotka**: ostavi stub bez opisa u raw fajlu i zapamti da je takav. Vidi
     § Nevalidirani oglasi ispod.
5. **Prepiši** `data/raw/linkedin-mail-<datum>.json` dopunjenim stubovima — isti fajl, isto
   ime, samo dodati `description`/`descriptionUrl`.
6. **Suvi prolaz.** `node run.mjs --dry --all --izvori=linkedin-mail --from-raw=data/raw/linkedin-mail-<datum>.json`
   i pokaži Zoranu levak izveštaj. U levku mora da stoji `(--all: filter iskljucen)`.
   Ako ne stoji, zaboravljen je `--all`.
7. **Tek posle njegove potvrde** pokreni istu komandu bez `--dry`. Dosijei dobijaju
   datum prolaza kao sufiks (`novi-oglasi/<n>.<Firma> - <datum>.md`,
   `proveriti/<Firma> - <naslov> - <datum>.md`) — to radi `src/dossier.mjs`, ne ručno.
8. **Završni izveštaj uvek sadrži listu nevalidiranih oglasa** (v. ispod), i kad je
   korak 7 preskočen.

## Nevalidirani oglasi — ništa se ne odbacuje bez Zoranove provere

Oglas je nevalidiran kad posle koraka 4 nema opis: nema ga na sajtu firme ni ATS-u,
oglas je zatvoren (404), ili je „firma“ posrednik (Jobgether, TaskVerse, Jobster…) bez
imena pravog poslodavca. Takav oglas **ne sme da nestane tiho** — ni izbacivanjem iz raw
fajla, ni zaključkom „verovatno zatvoren“. Zaključak o njemu donosi Zoran, ručno.

Zato na kraju svakog pokretanja, u odgovoru, stoji lista:

```
Nevalidirano — proveri ručno (<broj>):
- <Firma> — <naslov> — <lokacija>
  <LinkedIn link iz mejla> · <šta je pokušano, jedna rečenica>
```

Link je kanonski `https://www.linkedin.com/jobs/view/<id>/` iz stuba — isti koji je
stigao u mejlu. Ista pravila važe za dvosmislene pogotke koje je Zoran preskočio.

## Prazan opis obara filtriranje — ovo je glavna zamka

Blokeri (`src/blockers.mjs`) i rang (`src/rank.mjs`) rade **nad tekstom opisa**. Stub bez
opisa nema šta da obori, pa **prolazi sve blokere sa rangom 0** i završi u `novi-oglasi/`
kao da je čist. Izmereno 06.08.2026 nad fixture podacima: 8 od 8 stubova bez opisa prošlo
sve blokere.

Zato:

- Korak 4 nije opcion. Bez njega ovaj skill samo prepiše LinkedIn-ovu listu u foldere i
  zaobiđe ceo filter.
- Ako je posle koraka 4 **više od trećine** stubova ostalo bez opisa, stani i reci Zoranu
  pre koraka 7. Bolje je da prođe manje oglasa nego da neocenjeni prođu kao čisti.
- U levku iz koraka 6 nulti rangovi su signal da opisi fale, a ne da su oglasi loši.
- Svaki stub bez opisa ide i u listu nevalidiranih iz § iznad — prolazak kroz blokere
  ne znači da je proveren.

## Šta ovaj skill NE radi

Ne ocenjuje oglase — to je `job-match`, u razgovoru sa Zoranom. Ne skrejpuje LinkedIn
direktno. Ne piše u `prijave/` ni `odbaceni/`.
