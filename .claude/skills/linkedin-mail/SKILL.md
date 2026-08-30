---
name: linkedin-mail
description: Čita nove LinkedIn job-alert mejlove preko Gmail MCP-a, traži pun opis oglasa na sajtu firme, i ubacuje ih u job-search-automation pipeline. Koristi kad Zoran kaže da proveriš LinkedIn alerte, kaže „povuci linkedin mejlove", ili pita ima li nečeg novog u alert mejlovima.
---

# LinkedIn alert mejlovi → pipeline

Dovršava Fazu 3 iz `job-search-automation/PLAN-automatizacije.md`: alert mejl daje samo
naslov, firmu, lokaciju i link. Ovaj skill dopunjava **pun tekst oglasa** pretragom sajta
firme, pa oglase gura u isti pipeline kao arbeitnow/remotely/workwise.

**LinkedIn se ne skrejpuje direktno** — razlog je u § 7 tog plana. Opis se uvek traži sa
sajta firme ili sa njihovog ATS-a (Greenhouse, Lever, Personio, SmartRecruiters, Ashby).

## Odakle mejlovi

Gmail MCP, ne skripta. Faza sa sopstvenim OAuth-om (`fetch-linkedin-mail.mjs`) je odložena —
potrebna je tek ako se ovo bude vrtelo iz crona, bez Claude sesije. Kad se doda, piše
**isti** `data/raw/linkedin-mail-<datum>.json`, pa se koraci ispod ne menjaju.

Pretraga: `from:jobalerts-noreply@linkedin.com` uz vremenski prozor (`newer_than:7d`).
**Nema `job-alerts` labele** u Zoranovom nalogu — ne traži je, alerti stoje u INBOX-u.

Svi alert mejlovi su digest: jedan mejl nosi ~6 oglasa. Naslov mejla imenuje samo prvi
oglas (`„Senior Fullstack Engineer - Custom Solutions at Staffbase"`), pa se po naslovu
ne sme zaključivati koliko ih je unutra.

## Koraci

1. **Povuci mejlove.** `search_threads` sa gornjim upitom, pa `get_message` sa
   `messageFormat: FULL_CONTENT` za svaki.

   Uzmi **`plaintextBody`, nikad `htmlBody`.** Izmereno 06.08.2026: plaintext 9,8 KB
   naspram HTML 169,7 KB, a plaintext već ima naslov/firmu/lokaciju u zasebnim redovima.
   `get_message` ionako prelije rezultat u fajl zbog veličine — tada radi `jq -r
   '.plaintextBody'` nad tim fajlom umesto da čitaš ceo JSON u kontekst.

2. **Isparsiraj.** `parseAlertMails` iz `src/ingest/linkedin-mail.mjs` — prima
   `[{ id, date, plaintextBody }]`, vraća jedinstvene stubove (dedupe po job ID-u, jer se
   dnevni alerti preklapaju). Upiši ih u `data/raw/linkedin-mail-<datum>.json`.

   Ako neki mejl ne da nijedan oglas, funkcija to prijavi kao upozorenje — to znači da je
   LinkedIn promenio šablon. Pokaži Zoranu upozorenje, ne prećuti ga.

3. **Zapamti obrađene mejlove** u `data/gmail-seen.json` (`message-id → ISO datum`), i na
   početku preskoči one koji su već tu. Isti fajl i isti oblik koje bi pisala OAuth skripta.

4. **Dopuni opis** — za svaki stub bez `description`:
   - WebSearch: `"<firma>" "<naslov>"`, pa varijanta bez navodnika ako prva ne nađe ništa.
   - WebFetch najverovatniji pogodak **sa sajta firme ili njihovog ATS-a** — ne
     linkedin.com, ne indeed/glassdoor/stepstone agregator.
   - **Pouzdan pogodak** (firma se poklapa, naslov se poklapa ili je očigledna varijanta,
     tekst ima dužinu i opisuje tu ulogu): upiši `description` (pun tekst) i
     `descriptionUrl` (odakle je uzet) u stub.
   - **Dvosmisleno** (više kandidata, ili se naslov/firma ne poklapaju tačno): pokaži
     Zoranu 2–3 kandidata — naslov, URL, kratak citat — i pitaj koji je pravi ili da se
     preskoči. **Ne biraj sam kad nisi siguran.**
   - **Nema pogotka**: ostavi stub bez opisa i zapamti da je takav. Vidi upozorenje ispod.

5. **Prepiši** `data/raw/linkedin-mail-<datum>.json` dopunjenim stubovima — isti fajl, isto
   ime, samo dodati `description`/`descriptionUrl`.

6. **Suvi prolaz.** `node run.mjs --dry --izvori=linkedin-mail --from-raw=data/raw/linkedin-mail-<datum>.json`
   i pokaži Zoranu levak izveštaj.

7. **Tek posle njegove potvrde** pokreni istu komandu bez `--dry`.

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

## Šta ovaj skill NE radi

Ne ocenjuje oglase — to je `job-match`, u razgovoru sa Zoranom. Ne skrejpuje LinkedIn
direktno. Ne piše u `prijave/` ni `odbaceni/`.
