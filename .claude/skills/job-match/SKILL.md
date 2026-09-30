---
name: job-match
description: Ocenjuje oglase za posao za Zorana — pošteno meri poklapanje sa njegovim stvarnim profilom, prvo proverava tvrde blokere, i nikad ne izmišlja iskustvo koje nema. Koristi kad nalepi oglas, ubaci fajlove u job-search-manual/novi-oglasi/, pita „da li sam dobar match", traži da se oglasi rangiraju ili filtriraju, ili pita da li vredi da se prijavi.
---

# Ocena oglasa

Ovaj skill **ocenjuje** oglase i kaže šta dalje. Tekst piše drugi skill:

- Cover letter, tekst i PDF → `../cover-letter/SKILL.md`
- CV varijanta za prijavu → `../cv-sync/SKILL.md`
- About i headline na profilu → `../optimize-profile/SKILL.md`
- LinkedIn post ili komentar → `../linkedin-post/SKILL.md`

Ovde ostaje samo **koji ugao i koji track** to pisanje uzima za konkretan oglas.

## Pročitaj pre prve ocene

- `candidate-profile.md` — šta Zoran stvarno ume, šta ne, i koje tvrdnje sme da iznese
- `job-search-manual/prijave/` — oglasi koji su prošli. Ovo je skala: pročitaj ih pre prve ocene i
  uporedi nov oglas sa njima. Uzmi ono što jeste tu, ne pretpostavljaj.
- `job-search-manual/odbaceni/` — oglasi koji su pali. Kontra-uzorak: pogledaj zašto su pali, da ne
  preporučiš isti tip ponovo.

**Verdikt nosi folder, ne ime fajla.** Nema `-match` ni `-no-match` suffiksa — fajl u
`prijave/` je prošao, fajl u `odbaceni/` je pao. *(Promenjeno 31.07.2026; raniji fajlovi
sa suffiksom su zatečeno stanje, ne obrazac.)*
- `calibration.md` — obrazloženja ranijih ocena: zašto je Helsing pao sa 60% na 25%,
  zašto je Mimica graph rendering stavila u „bonus" a to je ceo posao, zašto je Personio
  dvaput pogrešno ocenjen. Tu su i greške u ocenjivanju, imenovane. Čitaj ga zbog
  **rezonovanja**, ne zbog brojeva — fajlovi u `prijave/` su aktuelno stanje.
  Kad zavrsis ocene svih fajlova u `novi-oglasi/`, dopuni `calibration.md` sa novim primerima i zaključcima.

## Gde stoje fajlovi

Putanje su od korena repoa.

- **Ulaz:** `job-search-manual/novi-oglasi/<n>-<oglas>.md` — Zoran nalepi ceo oglas, sa linkom.
  `<n>` je sledeći slobodan broj.
- **Prošlo:** `job-search-manual/prijave/<n>.<Firma>.md`
- **Palo:** `job-search-manual/odbaceni/<n>.<Firma>.md` — ne ocenjuj ponovo bez pitanja

## Postupak

Zoran obično nalepi više oglasa odjednom. Prođi kroz sve, pa tek onda rangiraj.

Proveri da li je oglas **full remote**. Ako nije, odmah ga odbaci.
*(Plata se više ne proverava — v. § Tvrdi blokeri.)*
Proveri da li se oglas ponovio, možda je već ocenjen ili odbijen ranije. Najlakše je preko
URL-a koji stoji na početku svakog fajla, npr. `https://www.linkedin.com/jobs/view/4445288082/`.
Ako je oglas već u `prijave/` ili `odbaceni/`, ne ocenjuj ga ponovo — dodaj mu suffix
`-duplicate.md`. *(To je jedini suffix koji se i dalje koristi: on označava da fajl nije
ocena nego duplikat.)*

```
- [ ] 1. Tvrdi blokeri
- [ ] 2. Green flags
- [ ] 3. PITAJ ZORANA pre nego što oboriš ocenu  ← obavezno, ne preskače se
- [ ] 4. Ocena u procentima
- [ ] 5. Šta dalje
- [ ] 6. Premesti i preimenuj fajl
```

**1. Tvrdi blokeri.** Ako ijedan pogodi, ocena je niska bez obzira na ostatak. Lista niže.

**2. Green flags.** Koliko oglas vredi kad prođe blokere. Lista niže.

**3. Pitaj Zorana pre nego što oboriš ocenu. OBAVEZNO.**

**`candidate-profile.md` nije potpun i Zoran to zna.** Nije sve upisao. Ako oglas oboriš
na osnovu rupe u profilu, a rupa zapravo ne postoji, izgubio si dobar oglas — i to se već
desilo (Lawrence Harvey, micro-frontendi, 28.07.2026; v. `calibration.md`).

**Pravilo: nijedna rupa iz profila ne obara ocenu dok ga ne pitaš za nju.**

Razlikuj dve vrste blokera — samo jedna ide na pitanje:

- **Bloker na strani oglasa** — hybrid, zaključano okruženje, traženo manje od 6 godina.
  Izvor je oglas, ne Zoran. **Ne pitaj, samo odbaci.** Nema šta on tu da doda.
  *(Plata je uklonjena sa ove liste 07.08.2026 — v. § Tvrdi blokeri.)*
- **Rupa na strani kandidata** — React, testovi, micro-frontendi, canvas, GraphQL,
  Vue, state management, bilo šta iz sekcije „Nema". Izvor je profil, a profil je nepotpun.
  **Moraš pitati pre nego što presudiš.**

**Kako pitaš — konkretno, ne generički:**

- Pitaj samo za rupe koje **stvarno menjaju ocenu**. Ako oglas pada na hybrid, ne postavljaj
  tehnička pitanja — bespredmetno je.
- Jedno pitanje po rupi, i to **o konkretnom radu**, ne „da li znaš X". Loše: „znaš li
  micro-frontende?" Dobro: „deployuju li se ti sajtovi nezavisno jedan od drugog, i povlači
  li jedna stranica u runtime-u kod koji je buildovao drugi tim iz drugog repoa?"
- Postavi ih **sva odjednom**, kao kratku listu, pa sačekaj odgovor. Ne ispituj ga u
  serijama.
- Navedi uz svako pitanje **šta zavisi od odgovora** — „ako je da, ocena ide sa 35 na X".
  Tako zna koliko mu se isplati da se seća.

**Posle odgovora:**

- Prepravi ocenu ako je odgovor to zaslužio, i reci otvoreno da si je prepravio i zašto.
- **Upiši novo saznanje u `candidate-profile.md`** — u „Ima" ako pokriva, ili kao
  nijansiranu stavku ako pokriva delimično. Ovo je jedini način da sledeća ocena ne
  ponovi isto pitanje.
- Ako je odgovor „nemam", rupa je potvrđena i ocena stoji. Sad je proverena činjenica,
  a ne pretpostavka iz nepotpunog fajla.
- **Ako si najavio „sa dobrim odgovorima ide na X%", moraš i da spustiš ocenu kad odgovori
  budu loši.** Recare je 28.07.2026. išao 62% → 55% baš tako. Provizorna ocena koja se samo
  penje nije ocena nego optimizam — v. `calibration.md`.

**Ovo važi i kad oglas prolazi i kad pada.** Nema tihog obaranja ocene na osnovu odsustva
podatka u profilu.

**4. Ocena.** Procenat i jedna rečenica verdikta:

- 65%+ — prijavi se odmah, priča je jaka
- 45–65% — stretch; reci gde tačno pada i šta bi ga podiglo
- ispod 45% — ne vredi vreme, i zašto

Uvek navedi šta je jako, šta je rupa, i koji je konkretan sledeći korak.

**5. Šta dalje.** Za oglas koji prolazi, konkretno a ne generički:

- **Track — koji master CV.** Postoje dva: Frontend (React/TS, component/design
  system, klasične FE odgovornosti) i AI Automation SDLC (AI-agentic tooling,
  delivery pipeline, developer enablement — „jako" green flags iz sekcije gore).
  Upiši ga kao zasebnu liniju u sekciju sa ocenom iz koraka 6, tačno u ovom obliku
  i od početka reda: `**Track:** Frontend — <razlog u jednoj rečenici>` ili
  `**Track:** AI Automation SDLC — <razlog>`. Naslov sekcije nije bitan —
  `../cover-letter/SKILL.md` i `../cv-sync/SKILL.md` traže baš taj marker
  (`grep '^\*\*Track:\*\*'`), bilo gde u fajlu. Razlog mora citirati konkretnu
  rečenicu/zahtev iz oglasa, ne samo „izgleda kao FE".

  **Ako oglas traži nešto što nijedan track ne pokriva** (v.
  `candidate-profile.md` § Nema), to je rupa u istom smislu kao korak 3 — **pitaj
  Zorana pre nego što upišeš track**, isto kao za bilo koju drugu rupu. Ne biraj
  track kao zaobilaznicu oko rupe.
- koje rečenice iz `assets/linkedIn-aboutMe.md` da se prepakuju za taj oglas
- **ugao za cover letter** — koju rečenicu iz oglasa pismo otvara i koji njegov rad na nju
  odgovara. Samo ugao; pismo piše `../cover-letter/SKILL.md`
- da li mu treba honesty sekcija u pismu, i koja rupa ide u nju
- da li mu treba nešto da izgradi pre prijave, i koliko to realno traje

**6. Premesti fajl.** Iz `novi-oglasi/` u **`prijave/`** ako je prošao, ili u
**`odbaceni/`** ako je pao. Preimenuj u `<n>.<Firma>.md` — **bez suffiksa, folder nosi
verdikt.** Zadrži ceo tekst oglasa i link, pa na kraj fajla dodaj sekciju sa ocenom i sa
onim iz koraka 5. Ta sekcija mora sadržati i `**Track:**` liniju iz koraka 5, od početka reda.

`novi-oglasi/` posle ovoga ostaje prazan osim onoga što još nije ocenjeno. Ako Zoran sam
vrati fajl tamo, to je njegova oznaka da nešto čeka — ne premeštaj ga nazad bez pitanja.

## Osnovno pravilo

**Nikad ne izmišljaj iskustvo.** Ako oglas traži nešto što nije u `candidate-profile.md`
pod „Ima", to je rupa — **ali prvo ga pitaj** (korak 3), pa je tek onda imenuj. Zoran je
izričito tražio da mu se ne ulepšava, jer se laž vraća kao pitanje na tehničkom intervjuu.

**Druga strana istog pravila:** nepotpun profil nije dokaz da nečega nema. Ne izmišljaj
iskustvo, ali ni ne brišeš ono koje postoji a nije zapisano. Oba smera greše isto.

Razdvoji **viđeno** od **zaključenog**: „ovo piše u oglasu" nije isto što i „ovo
pretpostavljam".

## Tvrdi blokeri

**Bilo kakav odlazak u kancelariju** — on-site, hybrid, „1+ day per week in the office",
„2 days in office", „hybrid, 3 days remote". Traži isključivo full remote, bez izuzetka,
uključujući i Berlin. Ovo je tvrd bloker, ne preferenca — ne pregovaraj ga i ne spuštaj
ocenu na „stretch". Živi u Berlinu, ali to ne otvara hybrid pozicije.

**Plata NIJE bloker.** *(odluka Zorana, 07.08.2026: „izbaci prag od 85.000, platu izbaci
iz filtera".)* Navedena plata — koliko god niska — **ne obara oglas i ne spušta ocenu.**
Prag je uklonjen i iz pipeline-a (`blockers.mjs`) i odavde; `plata.pragEur` više ne postoji.

Ako je plata navedena a deluje nisko, **imenuj je kao činjenicu u oceni i pusti dalje** —
to je pregovor, a pregovor vodi on, ne ovaj skill. Ono što on traži (`Gehaltsvorstellung`)
i JAEG obrazloženje stoje u `candidate-profile.md` § Uslovi, i služe **pisanju prijave**,
ne filtriranju oglasa.

**Zaključano okruženje sa nadzorom uređaja.** Vidi sekciju niže — nijansirano je i lako
se pogrešno primeni.

**Ručno pisanje unit test suite-a kao hard req** (Vitest, Jest, Cypress). Nije radio.
Ali Playwright vizuelno i cross-browser testiranje jeste postavio — v. nijansu u profilu,
ne odbacuj oglas prerano.

**Graph/canvas/WebGL/D3 rendering kao core posao.** Nula iskustva. Ni Henkel aplikacija
sa live camera feed-om nije koristila canvas. Ne traži izuzetke, nema ih.

**Duboka React arhitektura od nule kao primarni posao.** Ima React sertifikat i
produkcijsku React aplikaciju u AEM-u kod Henkela, plus component library obrazac iz
Figma design sistema. Nema: to nije _recent_, i nikad nije postavljao arhitekturu React
aplikacije od nule. Oglas koji traži „significant recent React" — reci to otvoreno.

**ML/model training, RAG evaluacije, MLOps.** Koristi modele, ne trenira ih.

**Traženo manje od 6 godina iskustva.** Ispod njegovog nivoa. *(Raniji dodatak „ili
mid-level plata" je uklonjen 07.08.2026 — plata više ni u kom obliku ne obara oglas,
ni kao iznos ni kao signal seniornosti. Seniornost meri po godinama i odgovornostima.)*

Take-home challenge plus React/testing hard req je kombinacija koja ga obara. Kaži to
otvoreno.

## Green flags

Što više pogodaka, to bolje. Prva grupa nosi najviše.

**Jako — retko, a njegovo:**

- „AI agents", „Claude Code", „Codex", „AI-assisted development" u zahtevima
- Developer experience, enablement, internal tooling, dev automation
- Omogućavanje ne-inženjerima da isporučuju uz guardrails
- Lead, Tech Lead, sole engineer, prvi inženjer u timu

**Solidno:**

- Design system, component library, Figma-to-code
- Client-facing, stakeholder management, rad sa PO i RE
- RFC kultura, code review, mentorstvo
- Front-end performance, Core Web Vitals
- AEM, Adobe, DXP, CMS platforme
- Uvođenje procesa, smanjenje tech duga

## Zaključano okruženje i eksterni AI alati

Zoran ne želi da radi na uređaju pod teškim nadzorom — JAMF, Jamf Protect, Defender for
Endpoint, CrowdStrike i slično kao režim rada.

**Budi realan kad ovo primenjuješ.** Nekakav MDM ili EDR ima skoro svaka kompanija koja
drži klijentske podatke, uključujući i Cognizant gde je sad. Primeniš li ovo doslovno,
odbacio si celo tržište. Izbegavaju se **zaključana okruženja**, ne postojanje agenta na
laptopu.

**Signali zaključanog okruženja — traži ih u oglasu:**

- Odbrana, aerospace, vladin kontraktor, ITAR ili export control
- „Security clearance", „background check", u Nemačkoj SÜG bezbednosna provera
- Bankarstvo i osiguranje na core sistemima, zdravstvo sa pacijentskim podacima
- „On-premise only", „no remote access to source", „company-issued device only"
- Nema pomena remote rada, a industrija je regulisana

**Praktična posledica je jači argument od preference:** tamo security tim prvo blokira
slanje koda spoljnim servisima. To znači bez Claude Code-a i bez Copilota — ceo njegov
diferencijator otpada prvog dana.

**Pitanje koje on postavlja njima, i to na recruiter screeningu, ne u četvrtom krugu:**

> Your ad says you want someone who uses AI-agentic tools daily. What does that look
> like in practice here — which tools are actually approved, and are there codebases
> where they're off-limits?

**Kontra-signal:** oglas koji imenuje Claude Code, Codex ili „AI-agentic development
tools" verovatno nije zaključano okruženje. Kompanija koja to piše je već rešila pitanje.

## Ulaznica nije isto što i diferencijator

Ovo je greška koju Zoran ponavlja. **AI nije ulaznica — React, TypeScript i testovi
jesu.** AI ga izdvaja _među kandidatima koji su već prošli filter_; ne pomaže mu da prođe
filter.

Brojevi iz uzorka od 10 oglasa (31.07.2026): moderan FE framework hard req **10/10**,
testovi **6/10**, AI u zahtevima **2/10**. Ako predloži da pojača AI naglasak da bi prošao,
podseti ga na to — i **prebroj ponovo** na oglasima koji su trenutno u `job-search-manual/prijave/`
i `job-search-manual/odbaceni/`, umesto da citiraš ovaj broj. Uzorak raste, brojevi zastarevaju.

## Održavanje

Ako Zoran kaže da je zatvorio rupu — napisao testove, obnovio React, napravio canvas
projekat — **ažuriraj `candidate-profile.md` pre sledeće ocene.** Rupe u tom fajlu su
stanje na dan pisanja, ne trajna činjenica.

Isto važi i kad iz podpitanja u koraku 3 izađe nešto što u profilu nije stajalo. **Svaki
odgovor na podpitanje se upisuje u `candidate-profile.md`**, i kad potvrđuje rupu i kad je
obara. Ako se ne upiše, sledeća ocena postavlja isto pitanje i profil nikad ne postane
potpun.

Skala se održava sama: svaki ocenjen oglas završi u `job-search-manual/prijave/` ili
`job-search-manual/odbaceni/` sa dopisanom sekcijom o oceni. Zato korak 6 nije administracija —
to je ono što sledećoj oceni daje osnovu.
