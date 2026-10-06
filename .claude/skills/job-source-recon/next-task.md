# Sledeći task — vratiti filtere (struka, home office, hybrid)

Zabeleženo 06.10.2026. **Prvo dokumentovati, pa vraćati.** Ništa od ovoga se ne radi dok
svaki izvor nema potpun `resources/<izvor>.md` (link, filteri, mapiranje parametara, zamke).

## Šta je sada (stanje 06.10.2026)

- **Filter struke je isključen po difoltu**; uključuje se samo sa `node run.mjs --struka`.
  Regex je u `podesavanja.json` → `struka.naslov` i `struka.tagovi` (`ROLE_FAMILY`, `FE_TAGS`
  u `src/config.mjs`). Razlog isključenja: arbeitsagentur je sa filterom propustio 2 od 18
  oglasa; pipeline sada samo prikuplja, a ocenu daje `job-match`.
- **Filter po slugu u remotely.de** (`REMOTELY.roleFilter`) radi samo uz `--struka`.
- **Home office / remote** na strani oglasa radi bloker `remote` u `src/blockers.mjs`
  (nad tekstom opisa, plus `remoteStructured` kad ga izvor ima). Bloker ne briše oglas, nego ga
  šalje u `<izvor>/proveriti/`.
- **Home office kao filter izvora** postoji samo za arbeitsagentur:
  `podesavanja.json` → `izvori.arbeitsagentur.filteri.homeoffice` (`prozentual_100;nv_true`).
  Značenje i zamke: `resources/arbeitsagentur.md`.
- **Hybrid** nema nijedan poseban filter u kodu osim što `remoteOf()` u `src/search/jobgether.mjs`
  hybrid oglas označava kao ne-remote.

## Šta treba da se uradi

1. **Dokumentovati po izvoru** (`resources/<izvor>.md`): koji filteri za struku, home office i
   hybrid postoje na sajtu/API-ju, kako se zovu parametri, koje su vrednosti dozvoljene, šta
   se tiho ignoriše. Za arbeitsagentur je to već većim delom urađeno; za arbeitnow, remotely,
   workwise i jobgether nije.
2. **Odlučiti gde filter živi** — u upitu ka izvoru (manje saobraćaja, ali parametri se tiho
   ignorišu), u kodu posle prikupljanja (pouzdano), ili oba. Svaki filter koji se šalje izvoru
   mora da prođe proveru da broj rezultata stvarno pada.
3. **Vratiti kao opcije**, ne kao tvrdo ponašanje: difolt ostaje „prikupi sve", a filteri se
   uključuju flagom (`--struka` već postoji) ili ključem u `podesavanja.json`. Predlog za
   home office / hybrid: isto, po izvoru, uz zapis u `podesavanja.json` ispod `izvori.<izvor>`.
4. **Blokeri podesivi iz `podesavanja.json`.** Danas su pravila `remote`, `architect`,
   `aem-backend`, `nivo`, `zakljucano` i `ugovor` napisana direktno u `RULES` u
   `src/blockers.mjs`, bez uključivanja/isključivanja po pravilu. Predlog: ključ
   `blokeri.<id>.ukljucen` (i prag gde ima smisla, npr. najviše godina iskustva u `nivo`),
   uz isti obrazac kao ostala podešavanja: difolt u `config.mjs`, upozorenje kad je vrednost
   neispravna, kod čita a nikad ne prepisuje. Pravila ostaju u kodu, a `podesavanja.json` samo
   bira koja važe. Izvor istine za samo značenje pravila je i dalje `job-match` § Tvrdi blokeri.
5. **Uskladiti dokumentaciju** kad se filteri vrate: `CLAUDE.md` (sekcija Komande i faza 3),
   skill `linkedin-mail-jobs` (sekcija o filteru struke), `SKILL.md` ovog skila.

## Otvorena pitanja za Zorana

- Da li je filter struke jedan za sve izvore ili po izvoru (jobgether i linkedin-mail-jobs su ga
  ranije zaobilazili jer su im ključne reči same izbor struke)?
- Šta tačno znači „hybrid": izbaciti ga, samo označiti, ili ostaviti bloker `remote` kakav jeste?
- Da li se „home office nach Vereinbarung" (bez procenta) tretira kao remote ili ne? Na
  arbeitsagentur je 33 od 34 oglasa baš takvo.

## Provera da je gotovo

`node run.mjs --dry --izvori=<izvor>` mora da pokaže da se broj u levku menja kad se filter
uključi/isključi, a ponovljen prolaz nad istim skupom daje `NOVO 0`.
