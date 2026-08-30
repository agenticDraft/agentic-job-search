# Kalibracija — ocenjeni oglasi

Referentna skala. Kad ocenjuješ nov oglas, uporedi sa ovima.

**Gde stoje fajlovi (od 31.07.2026):** prošli u `linkedIn/prijave/`, pali u
`linkedIn/odbaceni/` *(ranije `odustao/`)*. **Verdikt nosi folder — nema `-match` ni
`-no-match` suffiksa.**

## Statistika iz uzorka (10 oglasa, prebrojano 28.07.2026)

- **Moderan FE framework kao hard req — 10/10.** React imenovan u 9/10; dotbase je jedini
  izuzetak jer traži Vue.
- TypeScript eksplicitno — 7/10 *(VAPA ga stavlja pod „nice to have", što je i signal da
  je oglas mid-level)*
- Testovi, unit/integration/Jest/Cypress/testing pyramid — **6/10**, eksplicitno
- Code review, standardi, mentorstvo, RFC — 6/10
- Component library, design system, Storybook — 5/10
- Front-end performance — 5/10
- CI/CD kao imenovana odgovornost — 6/10
- **AI u zahtevima — 2/10** (Genki, Recare)

**Pouka stoji:** React/TS/testovi su ulaznica, AI je diferencijator. Ne obrnuto.

### Nova podela koja se pokazala bitna: AI u razvoju vs. AI u proizvodu

Ta dva „AI" oglasa nisu ista vrsta, i to menja i ocenu i pismo:

- **Genki — AI u tome KAKO se gradi.** „You use AI-agentic development tools daily
  (Claude Code, Codex)". Ovo je Zoranovo doslovno, bez rezerve.
- **Recare — AI u tome ŠTA se isporučuje.** „AI-native interface", „agentic UI patterns",
  „streaming-driven interactions". Susedno, ne isto: on ima orkestraciju i tool-use, ali
  nikad nije isporučio LLM feature krajnjem korisniku.

**Kad oglas pomene AI, prvo odredi koju od dve vrste traži.** Prva je njegov najjači
match u celom uzorku. Druga je stretch koji se dobija poštenom formulacijom, ne ćutanjem.
Razgraničenje stoji u `candidate-profile.md`, sekcija „AI-native features u proizvodu".

### Remote status je najjači filter u celom uzorku

Od 10 oglasa: **4 potvrđeno full remote** (Genki, Hostaway, Mimica, Lawrence Harvey),
**2 eksplicitno hybrid i odbačena** (Personio, dotbase), **4 nejasna** (Helsing, Frankfurt,
VAPA, Recare). Skoro polovina uzorka se ne može oceniti bez jednog pitanja recruiteru.

**Zato remote ide prvi, pre svake tehničke procene.** I traži se doslovna formulacija —
v. listu niže.

### Najveća greška u ocenjivanju do sada: obaranje ocene na nepotpun profil

*(28.07.2026)*

Lawrence Harvey je istog dana išao **35% → 40% → 45%**. Svaki skok je došao iz Zoranovog
odgovora, nijedan iz oglasa. Dva od tri razloga za prvobitno obaranje bila su netačna —
u profilu je pisalo da nikad nije postavljao React arhitekturu (radi je trenutno) i da
nikad nije ručno pisao testove (pisao je, basic).

**`candidate-profile.md` je nepotpun i to se ne menja.** LinkedIn PDF ne sadrži sve što je
čovek radio. Sekcija „Nema" znači *„nije potvrđeno da ima"*, ne *„sigurno nema"*.

**Otud obavezan korak 3 u `SKILL.md`:** nijedna rupa iz profila ne obara ocenu dok se
Zoran ne pita za nju. Blokeri na strani oglasa (hybrid, plata, zaključano okruženje) ne
idu na pitanje — tamo je izvor oglas. Rupe na strani kandidata idu, uvek.

**Pouka je simetrična i lako se pogrešno zapamti:** greška nije samo u izmišljanju
iskustva koje ne postoji. Isto je greška brisati iskustvo koje postoji a nije zapisano.
Oba puta ocena je netačna, samo u suprotnom smeru.

### Remote status — proveri ovo pre svega ostalog

- Genki — „fully remote", prolazi
- Mimica — „This Is a Fully Remote Position", evropske vremenske zone, prolazi
- Hostaway — „FULLY remote", mora EMEA, prolazi
- Helsing — ne piše ništa, pominje relocation support; pitati
- Frankfurt — „Frankfurt | Remote Working", dvosmisleno; pitati
- Personio — „2 days per week in the office", odbačeno
- Lawrence Harvey — „100% Home Office", u naslovu oglasa, prolazi
- dotbase — „Hybrid Working Culture", office u Berlin Kreuzköllnu, odbačeno
- VAPA — „possibility of working in a home office", mogućnost a ne režim; odbačeno
- Recare — **oglas sam sebi protivreči:** „remote-friendly" u benefitima, „remote-first"
  u zahtevima. Obavezno pitati pre svega ostalog.

Traži formulaciju u oglasu doslovno. „Remote-friendly", „hybrid", „flexible" i
„mostly remote" nisu full remote — to su najčešće 1–2 dana u kancelariji napisana
lepše. Ako oglas ne kaže jasno, to je pitanje za recruitera pre svega ostalog.

---

## ~70% — Genki, Lead Web Engineer

Fully remote, 25 ljudi, profitabilan startup, 5 godina, izveštava CEO-u.

**Zašto najbolji match:**
- „Building a setup where team members from all departments can build software themselves,
  with standardized review, security, and deployment" — **to je doslovno BAT projekat**
- „You use AI-agentic development tools daily (Claude Code, Codex)" — imenuje njegov alat
- Sole web engineer, vlasništvo nad tehničkim pravcem — lead rola
- Figma, CI/CD, developer tooling, cross-project infrastructure
- 25 ljudi, profitabilan, 5 godina = scale-up kućica bez consultancy tereta
- „Show us GitHub, code samples, prompts, a vibe-coded job application" — format u kome pobeđuje

**Rupe:** TypeScript/React/Astro dubina; GraphQL, Cloudflare, Railway.
„You've set up testing strategies for teams" **nije rupa** — postavio je Playwright
vizuelno i cross-browser testiranje kao deo harness-a. Rupa je ručno pisan unit suite.

Prijavni materijal: `linkedIn/oglasi/3.Genki.md` (headline, summary, cover letter).

**Verdikt:** prijaviti se odmah, ne čekati da bude spreman.

---

## ~55% — Recare, Tech Lead (Agent Frontend)

Nemački HealthTech, ~100 ljudi, SaaS platforma povezuje dve trećine nemačkih bolnica.

**Najbolji match posle Genkija, i prvi oglas u uzorku koji plaća agentic rad kao core
posao role.** „You design and evolve the agent architecture, especially around **agentic UI
patterns and orchestration logic**" — u 10 oglasa niko drugi to nije napisao.

**Zašto je njegov:** Tech Lead sa end-to-end ownershipom (rola #1 na njegovoj listi);
orkestracija sposobnosti u pouzdane workflow-e; React + TS + Apollo/GraphQL + Storybook;
**„Webpack 5 gradually migrating to Vite / SWC"** — poziv na Gulp→Webpack i Node 14→20
migracije, oboje dokazane pod rokom; mentorstvo, code review, rad sa Product/Design/QA.

**Rupe, sve potvrđene podpitanjima:** streaming UI nema; async složenost nema (Magento i
Shopify su bili **standardni fetch sa GraphQL-om**, asinhroni u trivijalnom smislu);
observability nema; SLA/runbooks/incident response nema formalno; Cypress nikad; healthcare
nula. **Tri od osam stavki u opisu posla su rupe.**

### Prvi put u uzorku da podpitanja OBORE ocenu: 62% → 55%

Do Recarea su podpitanja iz koraka 3 uvek dizala ocenu (Lawrence Harvey 35→40→45). Ovde su
je spustile. **To je znak da korak 3 radi, ne da je pogrešio.**

Provizornu ocenu od 62% sam vezao za pretpostavku da su Magento checkout i Shopify filter
bili async-teški. Nisu — Zoran je precizno odgovorio da je to bio običan fetch. Zadržati
62% posle takvog odgovora bilo bi inercija, ne ocena.

**Pouka: kad postaviš provizornu ocenu i najaviš „sa dobrim odgovorima ide na X", moraš je
i spustiti ako odgovori budu loši.** Inače provizorna ocena postaje samo optimističan
početak.

**Druga pouka, o čitanju sopstvenog nagađanja:** ja sam iz „Magento checkout sa payment
integracijom" zaključio složeno async stanje. Zvučalo je tako. Bio je fetch. **Integracija
sa platnim sistemom ne znači složeno klijentsko stanje** — to su dve različite stvari.

**Ostaje nerazrešen samo remote status** — oglas protivreči sam sebi, pita se prvo.

**Zaključano okruženje — signal postoji ali je slabiji nego kod Helsinga.** Pacijentski
podaci i compliance jesu tu, ali cela rola je gradnja AI-native agenta. Firma koja gradi
LLM proizvod nad bolničkim podacima je pitanje „šta smemo da pošaljemo modelu" već morala
da reši. **Pouka: „regulisana industrija" nije automatski zaključano okruženje kad je
proizvod sam po sebi AI.** Ovo je nijansa koju Helsing slučaj nije pokazao.

---

## ~50% — Jobgether (posrednik), Senior Design Engineer

Ocenjeno 06.08.2026 — provizorno 55%, spušteno na 50% posle podpitanja.

> **Ishod se razlikuje od preporuke.** Ocena je bila „ne prijavljivati u ovom stanju", ali
> je Zoran istog dana tražio CV i pismo i prijavio se svejedno. Fajl je zato u `prijave/`,
> a ne u `odbaceni/`. **Ocena od 50% i obrazloženje niže se ne menjaju** — verdikt skilla i
> njegova odluka su dve različite stvari i obe ostaju u zapisu.
>
> *Vredi pratiti kako se završi:* ako prođe kroz AI matcher uprkos praznom Next.js polju,
> pouka 3 niže je preoštra i treba je omekšati. Ako ne dobije odgovor, potvrđena je.

Full remote kroz Evropu, based in Germany, ownership marketing sajta. Nijedan tvrd bloker
ne pogađa — remote je doslovan, plata nenavedena, testovi se ne pominju, nema canvas ni
nemačkog. Pao je na nešto drugo.

### Nova pouka 1: prebroj imenovane tehnologije u zahtevu

Oglas nabraja u jednoj rečenici *„TypeScript, Next.js, Tailwind CSS, and Motion"*. Ima
dve od četiri. **To je najbrži test nivoa poklapanja koji sam do sada koristio** — brži
od čitanja cele sekcije zahteva, po uzoru na VAPA test („TypeScript u nice-to-have =
mid-level").

### Nova pouka 2: „ulaznica vs. diferencijator" nije pravilo o AI-u

`SKILL.md` to pravilo piše kroz AI, pa se lako zapamti kao pravilo *o AI-u*. Nije —
opšte je. Ovde nijedna od četiri stavke nije AI:

- **Ulaznica** — Next.js, Motion. Imenovane, binarno se filtriraju, propuštaju te ili ne.
- **Diferencijator** — accessibility, vizuelni sud. Tvrdi ih svaki kandidat, procenjuju
  se tek pošto prođeš filter.

**Zato je ishod podpitanja 2:2 bio neto minus.** Dve rupe zatvorene (a11y expert, vizuelni
sud expert), dve potvrđene (Next.js, Motion) — a ocena je pala. Kad brojiš odgovore iz
koraka 3, **ne broj ih kao jednake**; pogledaj koji je od njih ulaznica.

### Nova pouka 3: AI matching posrednik menja mehaniku, ne samo poverenje

Lawrence Harvey pouka je bila da agencijski oglas bez imena firme nosi **manje poverenje**
(ne znaš industriju, ne možeš proveriti zaključano okruženje, „up to €X" je vrh raspona).
Jobgether dodaje novu osu: oglas doslovno kaže *„an AI-powered matching process… against
the role's core requirements"*.

**Posledica koje kod ranijih oglasa nije bilo:** poštena formulacija rupe u pismu ovde ne
vredi ništa, jer pismo ne stigne do čoveka. Kod keyword matchera „Next.js" nije nijansa
koja se objašnjava — to je polje koje je prazno. **Kad oglas najavljuje automatsko
uparivanje, imenovane tehnologije se ponašaju kao tvrdi blokeri, a ne kao rupe.**

### Nova pouka 4: treći ishod pored „prijavi se" i „odbaci"

Do sada je verdikt bio binaran. Ovde je najkorisniji izlaz bio treći: **jedan artefakt,
pa ponovo ciljati kategoriju.** Landing page Next.js + Tailwind + Motion, ~nedelja dana,
zatvara tri stavke odjednom — Next.js rupu, Motion rupu i otvoreno pitanje #6 (portfolio
za Design Engineer role).

Uslov pod kojim ovo ima smisla i koji treba proveriti pre nego što se predloži: **ima
pistu** (dostupan 01.01.2027, bez pritiska) i **rupa se ponavlja kroz kategoriju**, ne
samo u ovom oglasu. Next.js ispunjava oba. Da je u pitanju bio, recimo, healthcare domen —
ne bi.

### Šta je bilo jako, da se prepozna sledeći put

**„Take end-to-end ownership of the marketing website" je njegov match, i to se lako
propusti.** AEM/DXP jeste marketing platforma — Mercedes-Benz, Opel, Peugeot, Citroën,
Henkel, BAT su marketing sajtovi. Oglas koji traži ownership marketing sajta plus design
sistem cilja pravo u rolu #3 sa njegove liste. **Ovakav oglas sa Next.js-om u ruci je
65%+**, ne 50%.

Nula AI u zahtevima — Hostaway obrazac. Ali za razliku od Hostawaya nema testova kao hard
req, a design sistem jeste eksplicitna odgovornost, pa je 10 poena više.

---

## ~20% — VAPA GmbH, Frontend Software Engineer

Ad automation startup (`vapa.ai`, Amazon). **Isti bucket kao Frankfurt: recruiter-tier,
mid-level.**

Cela lista zahteva: *JavaScript, ReactJS, HTML, CSS, English.* **TypeScript pod „nice to
have"** — i to je najjasniji signal nivoa u celom uzorku. Godine iskustva se ne traže.
Postoji već technical lead nad pozicijom. Plata nenavedena. Home office kao „possibility".

**Nova pouka o čitanju nivoa:** kad je **TypeScript u „nice to have" sekciji** oglasa za
front-end 2026, to je mid-level rola bez obzira na ostatak teksta. Brže je od traženja
godina iskustva, koje često ni ne piše.

**Adtech** je na njegovoj listi industrija za odluku (`zoran-to-improve.md`, sekcija 6),
uz odbranu, kockanje, kripto i duvan. Nije bloker dok ne odluči, ali je razlog više.

---

## ~25% — Helsing, Frontend Engineer

Odbrambena AI kompanija. Krajnji korisnik je vojska, kupci su evropske vlade
i oružane snage.

**Istorija ocene:** prvo ~45%, pa podignuto na ~60% kad je profil pokazao React
sertifikat i Henkel React aplikaciju, pa **spušteno na ~25% (27.07.2026)** zbog
dva blokera koja nisu tehnička.

**Zašto pada — bloker 1: eksterni AI alati.** Odbrambeno okruženje skoro sigurno
blokira slanje koda spoljnim servisima. Bez Claude Code-a i Copilota Zoranov ceo
diferencijator otpada prvog dana. Posao gubi smisao nezavisno od svega ostalog.
*Ovo je zaključak iz industrijske prakse, ne iz njihovog oglasa — treba ih pitati
direktno, v. pitanje u sekciji 3 `SKILL.md`.*

**Zašto pada — bloker 2: nadzor uređaja.** Zoran eksplicitno ne želi zaključana
okruženja. Odbrambeni kontraktor je najizraženiji primer te kategorije.

**Neizvesno, ali materijalno:** ako rola traži bezbednosnu proveru (SÜG), srpsko
državljanstvo može biti prepreka ili odugovlačenje. **U oglasu se clearance ne pominje**
i Helsing zapošljava po celoj Evropi, pa je moguće da za frontend na internim alatima
ne treba. Neproverено — pitati.

**Etika:** kompanija to eksplicitno stavlja u zahteve i vodi interne debate o tome.
Zoran na to nema formiran stav (v. sekciju 6 u `learning-plan/zoran-to-improve.md`).
Sporedno u odnosu na dva blokera gore, ali bi bilo treći problem.

**Šta je i dalje bilo dobro, za pamćenje:** „Build or adopt tools that help enforce
standards, or make our frontend engineers more efficient" je **njegov najjači
pojedinačni match u svih šest oglasa**. Plus RFC kultura, „unblocking others takes
precedence", mentorstvo, hiring pipeline. Ako naiđe sličan oglas **van odbrane**,
to je meta prvog reda.

**Tehničke rupe, da se ne zaborave:** „Own the UI end-to-end", React component library
od nule, Rust backendi, D3 dataviz kao nice-to-have. Traže „significant **recent**
React" — njegov je iz 2018–2021.

**Pouka za buduće oglase:** ovaj slučaj je razlog zašto sekcija 3 u `SKILL.md` postoji.
Tehnički match je bio drugi najbolji u uzorku, a posao svejedno ne valja za njega.
Proveri okruženje pre nego što se oduševiš listom zahteva.

---

## ~45–50% — Mimica, Senior Frontend Engineer (Mapper tim)

50 ljudi, scale-up, proizvod = process mape.

**Za:** 8+ godina, end-to-end ownership, „drive to improve team processes and reduce debt"
(najbolji pojedinačni match u celom oglasu), backend-lite, timezone.

**Protiv:** dnevni posao je data-visualisation + „interfaces that enable multiple users to
edit graph data" — graph/canvas je formalno „bonus", praktično sam posao. Stage 3 je live
system design nad data-intensive aplikacijom. Stage 2 take-home je React. Treniraju
sopstvene ML modele, ne konzumiraju — njegov agentic AI im nije potreban.

**Pouka za buduće oglase:** čitaj „Part of your day-to-day", ne samo „Requirements".
Mimica je graph rendering stavila u Bonus, a ceo posao je to.

---

## ~40% — Hostaway, Senior Frontend Engineer

Unicorn, 100% remote EMEA.

React/TS/Redux-Saga + Jest/Cypress/Playwright kao hard requirements, a11y, design system.
**Nula AI.** Njegov diferencijator ovde ne vredi ništa, a obe rupe su hard req.

---

## Odbačeno — Personio, Senior Frontend Engineer

**Pada na tvrd bloker: „This role requires 2 days per week in the office."**
Zoran traži isključivo full remote. Berlin ne pomaže — nije stvar udaljenosti.

Ne ocenjuj ovakav oglas procentom i ne piši „stretch". Reci da otpada i pređi dalje.

*(Ocena je kroz razgovor išla 35% → 40% → odbačeno. Dva puta sam pogrešio: prvo
sam ga oborio na lokaciju misleći da ne živi u Berlinu, pa ga podigao misleći da
berlinski hybrid prolazi. Nijedno nije bilo tačno — problem je hybrid sam po sebi.)*

Ostatak, da se zna da nije samo lokacija: React/TS strong i „comfortable with testing
strategies across the testing pyramid" kao hard req, „data heavy UI", compensation
i payroll domen koji ne poznaje, čist IC bez lead komponente, nula AI u zahtevima.

---

## ~45% — Lawrence Harvey (agencija), Senior Engineer React & Micro-Frontend

*(Ocena je istog dana išla **35% → 40% → 45%**, oba puta naviše i oba puta zato što je
`candidate-profile.md` bio nepotpun — ne zato što se oglas menjao. **Ovaj slučaj je razlog
zašto korak 3 u `SKILL.md` postoji.** Da nisam pitao, ostalo bi na 35% i na dva bloker
razloga od kojih je jedan bio netačan.)*

„100% Home Office", „Up to €88,000". Remote i plata prolaze.

**Šta je posle podpitanja ostalo, a šta otpalo:**

- **Micro-frontend arhitektura — rupa POTVRĐENA.** Njegov opis: jedan repo, jedan deploy
  za sve pod-projekte, isti JS a različit CSS. To je multi-tenant, ne federacija.
  Razgraničenje niže.
- **React — rupa OTPALA.** Trenutno aktivno radi React sa hooks, React Router, build
  setup i folder strukturom. Raniji zapis „nikad nije postavljao arhitekturu od nule"
  bio je netačan.
- **Testovi — rupa SUŽENA.** Pisao je ručno testove, ali basic. „Thorough unit and
  integration testing" i dalje ne pokriva.
- **Jenkins/SonarQube/ArgoCD — rupa POTVRĐENA.** Jenkins postoji na projektima, ali je
  backend posao. Njegov CI/CD je GitHub Actions.

**Zašto svejedno ne 55%+:** micro-frontend arhitektura je **pola naslova role**.
Kad je rupa u naslovu, procenat ne prelazi sredinu bez obzira na ostatak.

**Dobro je bilo:** CI/CD i GitHub Actions, „enforcing standards", „push cross-team
technical initiatives", rad sa PM/UX/QA/stakeholderima. Nula AI.

**Zašto 35% a Hostaway 40%:** isti obrazac (React/TS/testovi hard req, nula AI), ali
Hostaway je imao design system i component library kao eksplicitnu odgovornost — to je
Zoranova jaka strana. Ovde je na tom mestu micro-frontend arhitektura, gde je nula.

**Dve nove pouke:**

1. **Multi-tenant platforma nije micro-frontend arhitektura — osa je obrnuta.**
   Zoran je 28.07.2026. s pravom prigovorio da na BAT-u iz jednog codebase-a ide podrška
   za više nezavisnih sajtova, sa različitim temama i u različitim zemljama. Tačno je,
   i to je vredno — ali nije ono što oglas traži:

   - **Njegovo (multi-tenant):** jedan codebase → N sajtova. Varijacija se rešava u
     build-u ili request-u, kroz temu, tokene, konfiguraciju, market. Jedan artefakt,
     mnogo izlaza, jedan runtime koji on kontroliše.
   - **Micro-frontend:** N nezavisno buildovanih i deployovanih artefakata → jedan sajt.
     Sastavljanje u runtime-u, svaki fragment ima svoj repo, pipeline i tempo release-a,
     i vlasnik je drugi tim.

   Zato mu se **ne prenose teški delovi micro-frontenda:** dependency version skew
   (dva tima, dve verzije React-a na istoj stranici, ko je singleton), runtime contract
   između fragmenata i šta kad ga jedan tim promeni pre drugog, shared state i routing
   preko granice koju ne kontroliše, blast radius kad fragment padne u tuđem deploy-u.

   **Šta mu se prenosi i sme da tvrdi:** verzionisana deljena component library koju
   konzumira mnogo sajtova, izolacija tema i tokena, release safety sa 40 inženjera u
   istom codebase-u, sprečavanje da promena za jedno tržište obori ostala. To je stvarno
   platform-arhitektonsko iskustvo, samo drugog tipa.

   **Formulacija koja ne puca na sledeće pitanje:** *„I've run a single codebase serving
   independently themed sites across 100+ markets — versioned shared component library,
   per-market theming, release safety with forty engineers pushing into it. That's
   multi-tenant platform work, not runtime micro-frontend federation; I haven't done
   Module Federation."*

   **Test koji razrešava dilemu za bilo koju buduću platformu — tri pitanja:**
   deployuju li se delovi nezavisno jedan od drugog? Povlači li jedna stranica u runtime-u
   kod koji je buildovao drugi tim iz drugog repoa? **Nosi li svaki deo svoj JS bundle?**
   Sva tri da → federacija. Bilo koje ne → multi-tenant.

   **Za BAT je odgovoreno 28.07.2026 i ishod je multi-tenant:** jedan repo, jedan deploy
   za sve pod-projekte, **isti JS a različit CSS**, AWS, svaki sajt izolovan ali ne
   nezavisno deployovan. Treće pitanje je najjasnije — isti JS za sve sajtove je
   definiciono suprotno od federacije. **Rupa potvrđena, ne ponavljati proveru.**
2. **Agencijski oglas bez imena firme ocenjuje se sa manjim poverenjem.** Ne može se
   proveriti sekcija 3 (zaključano okruženje) jer se ne zna ni industrija ni kompanija.
   „Up to €X" je vrh raspona, ne ponuda — donja granica može biti ispod 75k. Ako oglas
   inače prolazi, to su prva dva pitanja recruiteru.

---

## Odbačeno — dotbase medical, Senior Software Engineer Frontend

**Pada na tvrd bloker: „Hybrid Working Culture", office u Berlin Kreuzköllnu.**
Drugi hybrid odbačen u uzorku, posle Personija. Bez procenta.

**Nova pouka o tome gde bloker stoji:** dotbase hybrid ne piše u zahtevima ni u opisu
posla — piše u **„What We Offer"**, upakovan kao benefit („great place to collaborate",
„flexible employer, family & life friendly"). Personio ga je bar napisao kao zahtev.
**Čitaj i benefit sekciju pre nego što počneš da ocenjuješ**, ne samo requirements i
day-to-day. Ovo je sestrinska greška uz Mimicu, gde je pravi posao bio sakriven u
„Bonus" sekciji.

**Ostatak, da se ne pomisli da je samo lokacija:** plata se ne pominje uopšte,
Vue.js preferred (nula), „unit, integration & visual regression tests" kao druga stavka
odgovornosti, on-call rotacija, nula AI. Plus signal zaključanog okruženja — bolnički
podaci pacijenata i compliance dokumentacija; *to je zaključak iz industrijske prakse,
ne iz oglasa.*

**Šta je bilo dobro, za pamćenje:** Storybook, component library, „shape frontend
architecture", rad sa dizajnerima i PO, Vite, CI/CD, GraphQL, 7+ godina. Sličan oglas
sa full remote i navedenom platom vredi oceniti — ali ako traži Vue, i dalje je ispod 45%.

---

## Preskočiti — „Software Engineer AI", Frankfurt

€60.000–85.000, traži 2+ godine iskustva. Recruiter spam, ispod njegovog nivoa.
Donja granica plate je ispod njegovog praga.

**Pouka:** raspon plate koji počinje ispod 75k i traži 2+ godine = mid-level rola
bez obzira na „AI" u naslovu.

---

## Odbačeno — Adobe, Senior Engineering Program Manager (Cloud Services), Hamburg

**Prvi slučaj gde je razlog „druga profesija", ne tehnički gap i ne standardni
bloker sa liste.** Naslov i ceo opis su formalno Program/Product Management: risk
management, executive status reporting, „step in as de-facto product owner",
stakeholder alignment na Director nivou. Traži se 7+ godina TPM/EPM iskustva, ne
inženjerskog. Nula frontenda, koda, dizajn sistema.

**Pouka o proceduri:** ovo namerno **nije** išlo kroz korak 3 (pitaj pre nego što
oboriš) jer to pravilo pokriva rupe iz `candidate-profile.md` (canvas, testovi,
micro-frontendi...) — konkretne veštine koje profil možda ne beleži potpuno. Ovde
nije bila u pitanju veština nego **da li ovo uopšte spada u struku koju traži**
(§ „Šta hoće" u profilu). To jeste pitanje vredno postavljanja — postavljeno je —
ali kao pitanje o pravcu karijere, ne kao tehničko podpitanje. Zoran je potvrdio:
odbaci, ne razmatra pivot na PM.

**Za buduće slične slučajeve:** kad oglas nema nijednu inženjersku odgovornost i
naslov je iz druge discipline (PM, QA Lead, Scrum Master, Solutions Consultant...),
pitaj prvo da li se pravac uopšte razmatra — to je brže i poštenije nego ocenjivati
procentom nešto što nije njegova profesija.

---

## Odbačeno — Adobe, Senior JavaScript/TypeScript SDE (Client Libraries), Hamburg

**Prvi slučaj gde nemački jezik obara oglas.** Traži *„Strong written and spoken
communication skills in German and English"* kao hard req, bez „nice to have"
kvalifikatora — za razliku od sestrinskog Adobe oglasa istog dana (Program Manager),
koji kaže „German is a plus, not a requirement". Isti dan, ista firma, ista
lokacija — dva različita jezička zahteva. **Pouka: ne pretpostavljaj da svi
oglasi iste firme/grada imaju isti jezički zahtev — proveri svaki posebno.**

Zoran je potvrdio da govori samo osnovni nemački. Ovo je sada upisano u
`candidate-profile.md` § Nema kao trajna činjenica, ne pitanje koje se ponavlja.

**Tehnički bi ovo bio solidan match** (React/TS jezgro, CI/CD, mentorstvo, IC rola
sa realnim senioritetom) — jezik je jedini razlog pada. Remote status ostao
nerazrešen jer bloker već odlučuje ishod; nije trošeno vreme na dalju proveru.
**Nova vrsta „javnog SDK" gapa:** oglas traži vlasništvo nad javnom biblotekom sa
backward-compatibility ugovorom prema eksternim konzumentima — Zoranov component
library rad je bio interni deo dizajn sistema, druga stvar. Upisano u profil kao
nijansa, ne rupa koja sama obara ocenu.

---

## Odbačeno — Unframe, „AI Transformation Architect EMEA" (07.08.2026)

**Slučaj u kome je pitanje o pravcu dalo suprotan odgovor od očekivanog — i dobro je
što je postavljeno.**

Oglas je pao na dva ad-side blokera koja su izgledala definitivna: „Architect" u naslovu
(hard filter iz profila) i „druga profesija" (ceo opis je technical pre-sales — demoi,
discovery pozivi, vožnja uz Account Executive-e). Po precedentu iz Adobe Program Manager
slučaja postavljeno je pitanje o pravcu karijere umesto tehničke ocene.

**Zoran je odgovorio „da, zanima me pre-sales".** Suprotno od Adobe PM-a, gde je rekao
„odbaci, ne razmatram pivot".

**Pouka br. 1 — ne pretpostavljaj da se jedno „ne" prenosi na susednu disciplinu.**
Odbijen PM pivot nije značio odbijen pre-sales pivot. Da je ovaj oglas odbačen na naslov
bez pitanja — što je bio bukvalno tačan postupak po profilu — pravac koji ga zanima ostao
bi zatvoren, i sledećih deset takvih oglasa palo bi tiho iz istog razloga.

**Pouka br. 2 — hard filter se sužava, ne briše, i sužava se po obrazloženju a ne po
reči.** Njegov razlog za „Architect" filter bio je *„nemam dovoljno backenda, za arhitektu
se traži full stack"*. To je argument protiv **inženjerskog** Architect naslova. U
pre-salesu je „Architect" prodajni naslov bez projektantske odgovornosti, pa se razlog ne
prenosi. Filter je zato ograničen na inženjerske role, a ne ukinut. **Kad menjaš tvrd
filter, čitaj zašto je nastao, ne kako se zove.**

**Pouka br. 3 — nova ocena mora da bude ozbiljna, ne formalnost.** Pošto se pravac otvorio,
oglas je ocenjen iznova bez naslovnog filtera. **Pao je i tako, na 35%** — hard req od
„5+ years in solutions engineering / technical pre-sales" (ima nula) i dostupnost tek
01.01.2027 kod sales hire-a u Series B startupu koji zapošljava protiv kvote. To je pošten
ishod: pravac otvoren, konkretan oglas i dalje pada. **Otvaranje pravca ne sme da bude
izgovor da se ocena podigne** — ista greška kao provizorna ocena koja se samo penje.

**Pouka br. 4 — pre-sales plata se ne meri istim pragom.** OTE = base + variable (70/30
ili 80/20). OTE od 85k daje bazu od ~60–68k, ispod JAEG-a, jer se za PKV računa
`regelmäßiges Jahresarbeitsentgelt` a provizija po kvoti tu po pravilu ne ulazi.

> **Nadograđeno istog dana, 07.08.2026.** Ovo zapažanje je izloženo Zoranu i njegov
> odgovor je bio širi od pitanja: **„izbaci prag od 85.000, platu izbaci iz filtera."**
> Platni prag je zato **uklonjen u celini** — iz `blockers.mjs`, `podesavanja.json`,
> `config.mjs`, `provera.mjs` i iz `SKILL.md` § Tvrdi blokeri. Nijedan oglas više ne pada
> na platu, ni navedenu ni pretpostavljenu.
>
> **Pouka o proceduri, i vrednija je od same izmene:** nalaz je krenuo kao usko pre-sales
> zapažanje („prag ne važi isto za OTE"), a otkrio je da mu **ceo mehanizam smeta**.
> Kad primetiš da pravilo ne važi za jedan slučaj, pitaj da li uopšte treba da važi —
> nemoj samo dopisivati izuzetak. Izuzetak bi ovde bio pogrešan odgovor.
>
> Broj i dalje postoji kao **`Gehaltsvorstellung`** — ono što on traži u nemačkoj prijavi.
> To nije filter, vlasnik mu je `candidate-profile.md` § Uslovi, a jedini potrošač
> `cover-letter/initiativbewerbung.md`.

**Šta je bilo jako, za sledeći sličan oglas:** njegov produkcijski agentic rad je realan
diferencijator kod firme koja prodaje AI inženjerima — career SE koji je samo demovao nema
tu kredibilnost. Bez hard req-a od 5 godina i bez problema sa datumom, ovo bi bilo 55–60%.
**Ciljati SE role u AI/developer-tooling firmama sa formulacijom „technical background,
we'll teach you the sales motion"**, ne one koje traže pre-sales staž.

## Nova vrsta oglasa: equity-only „co-founding" ponuda, nije zaposlenje

*(Oryn Group, 08.08.2026, ~10%, odbačeno.)*

Tehnički zahtevi (multi-agent orkestracija, MCP integracije, Claude Code) su bili tačno
njegov najjači profil — da je bilo zaposlenje sa platom, ocena bi bila visoka. Pao je na
nešto što tehnička lista ne pokriva: naknada je **equity in the agency you build**, oglas
sam kaže *„This is not a job."* Nema plate, nema Festanstellung, nema PKV/JAEG pokrića —
korak dalje od freelance/contractor aranžmana koji već pada po § Uslovi, jer freelance bar
ima fakturisan honorar, equity-only nema ni to dok agencija ne nađe prvog klijenta.

**Pouka:** kad oglas nudi equity, „build your own agency/startup" ili „co-founder" umesto
plate — proveri naknadu **pre** tehničke liste, ne posle. Ovo nije rupa na strani
kandidata (korak 3 se ne pita), nego strukturni bloker na strani oglasa, iste vrste kao
hybrid ili zaključano okruženje: piše u oglasu, ne u profilu. Vredi dodati u `SKILL.md`
§ Tvrdi blokeri ako se ovakav tip oglasa pojavi ponovo — za sada je jedan primer,
premalo za novo tvrdo pravilo.
