# Zoran — stvarni profil

Source: `assets/zoran-linkedIn-profile.pdf`, plus dopune koje je Zoran sam upisao.

> **OVAJ FAJL JE NEPOTPUN, I TO NAMERNO.** Nije sve što je Zoran radio ovde zapisano —
> osnova je LinkedIn PDF, a LinkedIn ne sadrži sve.
>
> **Posledica: nijedna rupa odavde ne obara ocenu oglasa dok ga ne pitaš za nju.**
> Obavezan korak 3 u `SKILL.md`. Kad dobiješ odgovor, upiši ga ovde.

## Kako se čita ovaj fajl

Tri nivoa, i razlika između njih nije jačina nego **šta sme da se napiše u prijavi**:

- **Ima** — tvrdi bez rezerve. Postoji konkretan projekat na koji može da pokaže.
- **Nijansirano** — ima susedno ili delimično. **Uvek uz tačnu formulaciju** koja se ne
  raspada na sledeće pitanje na intervjuu. Ovo NIJE rupa i ne obara ocenu samo po sebi.
- **Nema** — ne tvrdi nikad. Ako oglas to traži kao hard req, to je stvarna rupa.

Ako nešto pripada u dva nivoa, ide u **Nijansirano** — tamo se piše i šta ima i šta ne.
Ne duplira se između sekcija.

---

## Ima — tvrdi bez rezerve

### Najjače — ovim se prodaje

- **AI-assisted SDLC** — Claude Code, Copilot CLI, GitHub Actions, SpecKit spec flow,
  custom skills. **20+ custom skills** napravljenih na BAT-u.
- **`/pr-verify` skill** — otvara komponentu u realnom browseru preko Chrome DevTools,
  popunjava forme, klikće, pravi screenshot, poredi sa Figmom, kači dokaz na Jira tiket.
  Nastao jer nisu imali developer access na Figmu. **Njegov najbolji FE+AI diferencijator,
  i najčešće se podcenjuje.**
- **Multi-agent orkestracija** — biblioteka agenata sa skills/instructions, orchestration
  layer sa strogim pravilima invokacije, pipelines.
- **Agentic engineering rečnikom oglasa** — **tool-use** (Chrome DevTools, JIRA, GitHub kao
  alati koje agent poziva), **structured workflows** (SpecKit spec flow, pravila invokacije),
  **LLM orkestracija**. Kad oglas traži „agentic experiences" ili „tool-use", ovo je match.
  *Granica: to je agentic engineering u SDLC-u, ne AI feature u proizvodu — v. Nijansirano.*
- **Podizanje inženjerskog kvaliteta kroz AI** — AI PR botovi, quality/security gates,
  automatski review. Pokriva formulaciju „elevate engineering and AI-engineering quality".
- **Organizacija i uvođenje procesa** — dokazano na BAT-u, od nule, u timu koji se opirao.
- **Figma → specs → implementacija → vizuelna verifikacija** — uska i tražena veština.
- **Vizuelni sud i design craft — sam se ocenjuje kao expert.** *(06.08.2026, Jobgether
  oglas.)* Kad oglas traži „exceptional visual judgement", „strong eye for visual detail"
  ili „design craftsmanship" — **ne obara ocenu.** *Granica: ovo je samoprocena, ne
  dokument kao reference letter. Za Design Engineer role se filtrira portfolijom, a
  postojanje portfolija još nije potvrđeno — v. Otvorena pitanja.*
- **Rad sa klijentima** — PO, RE, arhitekte, C-level stakeholderi. Retko među inženjerima.

### Lead i enablement — dokazano, ne samoprocena

*(dodato 31.07.2026 iz `assets/Reference_Letter_ZoranMarkovic.pdf`. Letter je potpisao
Gerhard Gerner, **CEO Netcentric Deutschland GmbH**, i nosi nemačku ocenu 1 — „the
performance of Zoran always earned our full recognition in every respect". Sve niže su
citati iz njega, dakle tvrdnje koje potvrđuje treće lice, ne CV.)*

- **Formalno vodio dva front-end tima, 7 developera**, preko 2 godine na BAT nalogu, plus
  „global pod" za FE isporuku kroz više tržišta. *Ovo je konkretan broj za Lead role —
  jači od „mentorisao sam 40 inženjera", koje je uticaj, ne odgovornost.*
- **Njegov tim je proglašen najboljim u celom programu** — „recognised by project leadership
  as the best-performing team across the entire program".
- **DXN curriculum za internu akademiju** — napisao ga i držao. To je enablement posao:
  gradnja programa obuke, ne ad-hoc mentorstvo.
- **React Director, vodio React Community of Practice** u firmi. Interna tehnička vertikala.
- **Arbeitszeugnis je u ruci i vredi ga slati uz svaku prijavu.** U nemačkom procesu se
  Zeugnisse traže po difoltu, a ocena 1 potpisana od CEO-a je retka.

> **Posledica za role:** kad oglas traži „lead a front-end team", „mentorship", „raise the
> bar across the team" ili „developer enablement" — postoji dokument, ne samo tvrdnja.
> Ovo je ujedno dokaz protiv njegove sopstvene rezerve iz „Otvorenih pitanja" #4.

### React — produkcijsko iskustvo, četiri projekta

*(Ova sekcija je 28.07.2026. prešla iz „Nema" u „Ima". Ranije je pisalo da nema recent
produkcijski React i da nikad nije postavljao arhitekturu od nule — oba netačna.)*

- **Henkel** — React + Redux + REST API endpoints **od nule**. Aplikacija za vizualizaciju
  boje kose preko live camera feed-a i model simulacija. Plus component library iz Figma
  design sistema sa theming sistemom.
- **Headless custom filter** za 1000+ proizvoda, sa Shopify bazom.
- **Headless renderovanje proizvoda iz Magento-a** — 5+ varijanti istog proizvoda sa
  različitim atributima, plus logika preporuke povezanog proizvoda pri kupovini.
- **Headless checkout/cart** sa payment integracijom — Magento backend, JS frontend,
  **GraphQL API**.
- **Trenutno aktivno radi React** — hooks, React Router, build setup, folder struktura.

**Recency je rešena za Magento (31.07.2026, iz reference letter-a).** Magento rad je
**BAT, februar 2023 – jul 2025**, dok je bio front-end lead. Potvrđuju ga dva nezavisna
izvora: LinkedIn („Led the headless integration of Magento e-commerce within a sophisticated
digital ecosystem") i reference letter Netcentric-a — *„he was one of the few colleagues in
the company with in-depth magento e-commerce experience"* i *„over more than two years as
front-end lead on the BAT account… the multicat and catalyst magento e-commerce integrations,
technically complex platforms built entirely to the client's specifications."*

Kad oglas traži „significant **recent** production React/e-commerce" — **to više nije
slabost**, i ne treba se izvinjavati za nju. Formulacija koja se drži: *„two years leading
front-end on headless Magento commerce integrations, through mid-2025."*

> **Ostaje otvoreno:** datum i klijent za **Shopify** filter projekat. Reference letter
> pominje samo Magento. Ne pretpostavljaj da je Shopify iz istog perioda.

### Platforma i infrastruktura

- **Adobe AEM / AEMaaCS** — 10 godina, component sistemi.
- **Multimarket theming za AEM, razvijen od nule** — deljena component library, izolacija
  tema i tokena, release safety sa **40 inženjera u istom codebase-u**. To je
  **multi-tenant / multi-site platforma** i stvarno platform-arhitektonsko iskustvo.
  *(Granica prema micro-frontendima je u sekciji Nijansirano — ne meša se sa federacijom.)*
- **Cross-project infrastruktura** — Codeplicity: platforma koja vrti hiljade aplikacija
  iz jednog engine-a. Genki to traži tim rečima.
- **CI/CD: GitHub Actions** — svakodnevno, i tu je jak.
- **Platforma na 100+ zemalja** — BAT AEM platforma pokriva **100+ zemalja**. Stoji na
  oba master CV-a. *(potvrđeno 13.08.2026)*
- **AEM MCP proširen sertifikatnom autentikacijom** za enterprise klijente. Ovo je
  nosivi dokaz za AI Automation SDLC track, ne dekoracija. *(potvrđeno 13.08.2026)*

### Migracije i performanse

- **Node 14 → Node 20** — 200+ izmenjenih js/scss fajlova u 2 nedelje, otišlo u produkciju
  na BAT-u. Najbolji dokaz da ume da izvede rizičnu migraciju pod rokom.
- **Gulp → Webpack** — vodio migraciju na Mercedes-Benz projektu.
- **Front-end performance** — Lighthouse, Core Web Vitals. Optimizacija performansi na
  BAT-u. Sertifikat „Website Performance Optimization".
- **Accessibility — expert, iz projektnog rada.** *(potvrđeno 06.08.2026, Jobgether oglas.)*
  Nije bio Lighthouse skor sa strane nego deo isporuke. Kad oglas traži „strong understanding
  of accessibility" ili WCAG — **to nije rupa i ne obara ocenu.**
  > *Nerazrešeno za intervju:* koji tačno deo — WCAG kriterijumi u definition of done,
  > axe/Lighthouse a11y u CI-ju, screen reader, focus management. Tvrdnja stoji, ali za
  > tehnički krug treba jedan konkretan primer. V. Otvorena pitanja.

### Jezici i alati

- **Vanilla JavaScript** — fundamenti su realni, 10 godina bez framework-a.
- **TypeScript** — dokaz su četiri React projekta gore. Ne spušta se u „nijansirano":
  TS je hard req u skoro svakom oglasu i on ga tvrdi. *Vredi izbrusiti formulaciju za
  intervju (v. otvorena pitanja), ali to je oštrenje tvrdnje, ne sumnja u nju.*
- **GraphQL** — potvrđeno kroz Magento checkout integraciju, nije više samo stavka u listi.
- **Python**, REST API endpoints.
- **Webpack** — vodio migraciju, dubina realna.
- **TailwindCSS** i **Bun** — zna oba, potvrdio 28.07.2026. *(Ranija napomena „dubina
  neproverena" je obrisana — bila je moja pretpostavka, ne njegova tvrdnja.)*
- **Sertifikati:** Claude Code in Action, Claude Code 101, React, Accelerated JavaScript
  Training, Website Performance Optimization, Testing Clientside JavaScript.

---

## Nijansirano — ima delimično, koristi tačnu formulaciju

**Ovo nisu rupe.** Oglas koji ovo traži ne otpada — ali prijava mora da koristi
formulaciju iz odgovarajuće stavke, jer se svaka druga raspada na intervjuu.

### Testovi

**Ima:** postavio Playwright cross-browser vizuelno testiranje unutar AI harness-a, sa
dokazima koji se kače na JIRA tiket, plus Chrome DevTools automatizaciju. „Test Automation"
mu je skill na profilu, sertifikat „Testing Clientside JavaScript". Pisao je i unit testove
ručno — ali sam kaže: basic.

**Nema:** dubinu. Testing pyramid kao svestan izbor, Testing Library obrasci, fixtures,
integration testovi. Kad oglas traži testove sa pridevom — „thorough", „strong",
„extensive" — to je i dalje rupa.

**Tačna formulacija:** *„my testing experience is mostly the pipeline; I've written suites,
but basic ones."* Ne više „not the suite" — to ga potcenjuje.

> **Otvoreno:** u profilu je pisalo „Jest testiranje sa Vitest". To su dva različita
> runnera — treba znati koji je stvarno koristio.

### Micro-frontendi

*(Potvrđeno 28.07.2026 njegovim opisom BAT setup-a — ne pretpostavka.)*

**Ima:** multi-tenant platformu, v. sekciju „Platforma i infrastruktura" gore.

**Nema: runtime federaciju.** Njegov opis: *jedan repo, jedan deploy za sve pod-projekte,
**isti JS** a različit CSS, deploy na AWS.* Kod micro-frontenda je obrnuto po svakoj osi —
**različit JS** po fragmentu, svaki iz svog repoa i pipeline-a, sastavljanje u runtime-u,
nezavisan release po timu. „Svaki sajt je nezavisan" kod njega znači **izolovan** (svoj URL,
jedan ne obara drugi), ne **nezavisno deployovan**. Nema Module Federation, single-spa,
version skew između timova, runtime contract između fragmenata, ni routing/shared state
preko granice koju ne kontroliše.

**Tačna formulacija:** *„multi-tenant platform work, not runtime micro-frontend federation;
I haven't done Module Federation."*

### AI-native features u proizvodu (za razliku od AI u razvoju)

*(dodato 28.07.2026 — razgraničenje nastalo iz oglasa koji traži „integrate AI-native
features and agentic experiences into products".)*

**Ima:** LLM-ove, tool-use, structured workflows i multi-agent orkestraciju — sve na
produkcijskom nivou. Zna kako se agent vodi, gde se lomi, kad mu se veruje.

**Nema — i ovo je prava granica:** njegov AI rad je **interni razvojni alat**, ne feature
koji krajnji korisnik vidi u proizvodu. Nikad nije isporučio AI funkcionalnost end-userima,
sa svim što uz to ide — cena po pozivu, latencija u UI-ju, streaming, prompt injection od
korisnika, fallback kad model padne, evaluacija kvaliteta odgovora u produkciji.
**Retrieval/RAG posebno ne** — v. „Nema / ML".

**Tačna formulacija:** *„I've built agentic systems in production, but on the engineering
side of the product — orchestration, tool-use, structured workflows. I haven't shipped an
LLM feature to end users, and I haven't done retrieval or streaming UI."*

*Streaming je 28.07.2026. potvrđen kao rupa — v. „Nema / Streaming UI". To je najjeftinija
stavka za zatvaranje na celoj listi (dan-dva rada) i najčešće traženo u AI-native oglasima.*

**Kako se ocenjuje oglas:** ako traži „AI-native features **into products**" plus
Retrieval — to je stvarna rupa i oglas pada. Ako traži „agentic development", „AI-assisted
SDLC" ili „internal tooling" — to je njegov najjači match, ne rupa.

### Animacija i motion

*(potvrđeno 06.08.2026, Jobgether oglas.)*

**Ima:** parallax. Dakle scroll-driven animacija je radio i koncept mu nije nov. Sam kaže
da je ostatak „lako da se nauči" — što je verovatno tačno s obzirom na CSS i JS fundamente,
ali **naučivo nije isto što i isporučeno** i ne sme se tako napisati u prijavi.

**Nema:** rad sa animacionom bibliotekom (Motion / Framer Motion, GSAP), orkestrirane
sekvence, page transitions, `prefers-reduced-motion` fallback kao deo isporuke.

**Tačna formulacija:** *„I've done scroll-driven parallax work; I haven't shipped with a
motion library like Motion or GSAP."*

**Kako se ocenjuje oglas:** ako je animacija jedna stavka među mnogima — nijansa, ne obara.
Ako je „interaction design and animation" u accountabilities kao stalan posao (Design
Engineer role) — spušta ocenu, jer se ta rola bira po tome.

### Poslovna automatizacija — low-code, evals, operativni procesi

*(potvrđeno 26.09.2026, Jobgether „Senior Automation Specialist".)*

**Ima:** agentic automatizaciju u produkciji (v. § Najjače) i ručnu proveru na stvarnim
tiketima pre rollout-a — to pokriva „manual QA" i „real-world testing".

**Nema:**

- **n8n / Make / Zapier u produkciji** — isprobao, nije pustio u produkciju.
- **Evals sa pragom** — nema fiksan set slučajeva ni eksplicitan prag prolaznosti pre
  rollout-a izmene skilla/agenta. Provera je ručna.
- **Automatizacija za ne-inženjere** — sva njegova automatizacija je SDLC/developer
  tooling; korisnici su bili developeri. Nema metriku „sati ručnog rada uklonjeno
  nedeljno".

**Tačna formulacija:** *„My automation work is agentic and in production, but it's been
for engineering teams — I've tried n8n, not shipped with it, and my pre-rollout checks
are manual, not a formal eval set with thresholds."*

**Kako se ocenjuje oglas:** „AI automation / operations automation" role gde su n8n,
evals i „hours saved" hard req — pada ispod 45%, posebno kod AI matching posrednika.

### Pre-sales / Solutions Engineering

*(otvoreno 07.08.2026, Unframe „AI Transformation Architect EMEA". Na direktno pitanje da
li razmatra pivot u technical pre-sales odgovorio je **„da, zanima me pre-sales"**. Pravac
je time otvoren — ali otvoren pravac nije isto što i iskustvo, pa ide ovde, ne u „Ima".)*

**Ima — i to je jače nego kod prosečnog inženjera:**

- **Client-facing rad kroz celu karijeru.** Cognizant Netcentric je consultancy: PO, RE,
  arhitekte, C-level stakeholderi. Reference letter to potvrđuje kao treće lice.
- **Objašnjavanje tehnike ne-tehničkoj publici** — DXN curriculum za internu akademiju
  (napisao ga i držao), React Community of Practice.
- **Stvarno gradi ono što bi prodavao.** Za AI-first platformu je ovo redak kombo:
  produkcijska multi-agent orkestracija, tool-use, 20+ custom skills. Career SE koji je
  samo demovao nema tu kredibilnost u sobi.

**Nema — i ovo je prava granica, „motion", ne veština:**

Njegov client-facing rad je **post-sale isporuka**, ne **pre-sale**. Kupac je već potpisao,
budžet je već odobren. Pre-sales je druga disciplina i hiring manageri je tako i filtriraju:

- Discovery i kvalifikacija kao metod — MEDDIC/MEDDPICC, BANT, pain-to-value mapiranje
- Demo kao zanat — gradnja demo okruženja, demo krojen po prospektu pod vremenskim pritiskom,
  rad sa prigovorima u prodajnom kontekstu
- POC/pilot scoping, RFP odgovori, security questionnaire
- Rad u tandemu sa Account Executive-om, pipeline, kvota, deal cycle

**Tačna formulacija:** *„I've spent ten years in a consultancy, technical and client-facing —
but always after the deal was signed. I haven't run discovery or carried a number."*

**Kako se ocenjuje oglas:** „5+ years in solutions engineering / technical pre-sales" kao
hard req je **stvarna rupa** i ne prelazi se preko nje. Oglas koji traži „technical
background, we'll teach you the sales motion", ili SE rolu u AI-alat firmi gde je
proizvod razvojni alat — tamo je konkurentan i ocenjuje se visoko.

**Otvoreno i bitno pre prve prijave:** v. Otvorena pitanja #8 (OTE vs. JAEG) i #9 (putovanja).
Oba mogu da obore ceo pravac, a nijedno se ne vidi iz oglasa.

### SaaS portfolio

**Ima:** portfolio web aplikacija iz jedne osnove — multi-tenant AEM platforma sa više
nezavisnih sajtova, Codeplicity sa hiljadama aplikacija iz jednog engine-a. Uključujući
i „operate": produkcijski deploy, migracije pod rokom, performanse pod realnim opterećenjem.

**Nema:** rad **unutar SaaS proizvodne firme**. Cognizant je consultancy — proizvod je
bio klijentov, model naplate nije bio subscription. Nema retention metrike, product
analytics, feature flag eksperimente, multi-tenant billing.

### Adobe EDS

**Ima:** malo iskustva. **Realno:** EDS je AEM koji je radio 10 godina, pa savladavanje
ide brzo. Ne prodaje se kao dubina, ali ne treba ni odbaciti oglas zbog njega.

### Scale-up, founding engineer

**Nema:** nikad zaposlen u scale-upu; Cognizant je oko 350.000 ljudi. Kućica na LinkedIn
filteru ostaje neoznačena.

**Ima obrazac:** BAT platformu je gradio founding-engineer obrascem — sam, od nule, bez
tima i budžeta, iterativno uz gradnju procesa. Niko ga nije tražio; napravio ga je jer je
video problem. To je pošteno reći, i tako stoji u About-u. **Pokriva formulaciju
„entrepreneurial, outcome-driven mindset"** — tu ne treba nijansa, to je stvarno on.

---

## Nema — NIKAD ne tvrditi

**Graph, canvas, geometry.**
Nula. Ni canvas, ni SVG rendering, ni WebGL/Three.js/PixiJS, ni D3/Cytoscape/React Flow,
ni hit-testing i koordinatni sistemi. Ni Henkel aplikacija sa live camera feed-om nije
išla preko canvas-a. *(Provereno 27.07.2026 — nema izuzetka na koji može da se pozove.)*

**ML, model training, Retrieval/RAG.**
Koristi modele, ne trenira ih. Nema RAG ni retrieval pipeline, nema evaluacije, fine-tuning,
MLOps, vector DB. **Kad oglas u istoj rečenici nabroji „LLMs, Retrieval, Tool-Use" — prva
dva nema, treće ima jako.** Ne prelazi se preko toga; retrieval je zasebna disciplina.

**Streaming UI.** *(potvrđeno 28.07.2026)*
Nema. Ni `ReadableStream`, ni Server-Sent Events, ni websocket stream u UI-ju — dakle ni
token-by-token ispis, ni prekid u toku, ni retry nad streamom. Ovo je danas standardna
interakcija za svaki LLM proizvod, pa se pojavljuje u svakom „AI-native product" oglasu.

**Async dubina — nijansa unutar rupe.** Njegovi React projekti (Magento checkout/cart,
Shopify filter) koristili su **standardni browser fetch sa GraphQL-om**. To je asinhrono
u trivijalnom smislu — svaki mrežni poziv je. Nema optimistic update sa rollbackom, race
condition handling između zahteva, ni keširanje odgovora kao svestan obrazac.
*Ne prodaje se kao „complex asynchronous state management".* Stateful UI **ima** (cart,
koraci plaćanja, filter state); async složenost nema.

**Observability.** *(potvrđeno 28.07.2026)*
Nema. Datadog, Grafana, Sentry, OpenTelemetry — logs/metrics/traces u produkciji nisu bili
njegov posao. Pojavljuje se kao odgovornost u lead rolama, pa se imenuje.

**SLA, runbooks, incident response.** *(potvrđeno 28.07.2026)*
Nema formalno vlasništvo. Izveo je rizične produkcijske migracije pod rokom (Node 14→20,
200+ fajlova, 2 nedelje) — dakle **u praksi** ume, ali nije bio dežuran, nije vodio incident
response i nije pisao runbook. Za Tech Lead rolu koja to imenuje, ovo ide u honesty sekciju.

**Cypress.** *(potvrđeno 28.07.2026)*
Nikad, ni malo.

**Healthcare domen.**
Nema. Ne poznaje kliničke workflow-e, ni HL7 FHIR, ni bolničke sisteme, ni regulatorni
okvir oko pacijentskih podataka. Domenska iskustva su: automotive (Mercedes-Benz, Opel,
Peugeot, Citroën), consumer goods (Henkel), tobacco (BAT), e-commerce (Shopify, Magento).
*Domen se uči i nije hard bloker sam po sebi — ali ako oglas traži „understand healthcare
workflows" kao zahtev, to je rupa koju treba imenovati, ne preskočiti.*

**Data-intensive system design.**
Real-time collaborative editing, CRDT, virtualizacija velikih dataset-ova — nema.

**Jenkins, SonarQube, ArgoCD.** *(potvrđeno 28.07.2026)*
Jenkins postoji na projektima, ali je backend posao — nije ulazio dublje. SonarQube i
ArgoCD nisu potvrđeni. Njegov CI/CD je GitHub Actions.

**Next.js u produkciji.** *(potvrđeno 06.08.2026, Jobgether oglas — njegove reči:
„nemam production znanje".)*
Nema. Ni SSG/ISR/SSR kao svestan izbor po stranici, ni App Router, ni `next/image`,
ni revalidacija, ni Next-specifičan deploy pipeline. **React sam po sebi ostaje „Ima"**
(v. sekciju React gore) — rupa je meta-framework, ne biblioteka.

> **UPOZORENJE — živi LinkedIn profil tvrdi suprotno.** Headline glasi *„Full-Stack
> (JS/TS · React · **Next.js** · Phyton)"*. To je tvrdnja koju ne može da odbrani na
> tehničkom krugu, i gore od toga: kod oglasa sa automatskim uparivanjem ga propušta u
> proces iz kog će ispasti. **Ili se rupa zatvori, ili tvrdnja skine sa profila** — ne sme
> ostati oboje. Izmena headline-a ide kroz `../optimize-profile/SKILL.md`.
>
> *(Isti headline ima i tipfeler „Phyton" umesto „Python" — u headline-u koji čitaju
> recruiteri i keyword matcheri.)*

> **Ovo je skupa rupa i vredi je zatvoriti, ne samo evidentirati.** Next.js je danas
> podrazumevan u marketing/web oglasima i najčešće stoji u istoj rečenici sa TypeScriptom
> i Tailwindom — a oba već ima. Sa četiri React projekta iza sebe, put od nule do
> demonstrativnog nivoa je nedelja dana, ne mesec.

**Nemački jezik na profesionalnom nivou.** *(potvrđeno 05.08.2026, Adobe Hamburg
Client Libraries oglas)* Samo osnovni nemački, ne dovoljno za profesionalnu pisanu i
govornu komunikaciju na poslu. Kad oglas traži nemački kao hard req (ne „nice to
have" / „a plus") — to je tvrd bloker, ne pitanje za korak 3.

**Javni SDK / client library ownership.** *(potvrđeno 05.08.2026, isti oglas)*
Nema iskustvo održavanja javnog npm paketa ili SDK-a sa backward-compatibility
ugovorom za eksterne konzumente. Njegov component library rad (v. „Ima" gore) je
**interni** deo dizajn sistema, konzumiran unutar iste organizacije — ne javni paket
sa verzionisanim API ugovorom prema nepoznatim potrošačima.

---

## Uslovi

- **PLATA NIJE FILTER.** *(odluka Zorana, 07.08.2026: „izbaci prag od 85.000, platu izbaci
  iz filtera".)* Nijedan oglas se **ne odbacuje i ne dobija nižu ocenu** zbog navedene plate,
  koliko god niska bila. Prag je uklonjen iz pipeline-a (`blockers.mjs`, `podesavanja.json`)
  i iz `SKILL.md` § Tvrdi blokeri. Ako je iznos naveden i deluje nisko — **imenuj ga kao
  činjenicu u oceni i pusti oglas dalje.** Pregovor vodi on.

  Sve niže služi **pisanju prijave i pregovoru**, ne odabiru oglasa:

- **Gehaltsvorstellung — brojevi provereni 31.07.2026, granica od 75.000 € ne važi.**

  > ## `Gehaltsvorstellung: ab 85.000 € brutto jährlich`
  >
  > **Ovo je jedino mesto gde taj broj stoji kao vrednost.** *(potvrdio 07.08.2026.)*
  > Čita ga `../cover-letter/initiativbewerbung.md`. **Nije filter** — nijedan oglas se ne
  > odbacuje ni ne ocenjuje po njemu; to je iznos koji **on traži**, ne prag koji **oglas
  > mora da pređe.** Ako ga menjaš, menjaš ga ovde i nigde drugde.

  Zašto baš toliko — Jahresarbeitsentgeltgrenze (JAEG, prag za PKV), **i ovo je jedino
  mesto gde ovi brojevi stoje:**
  - **2026: 77.400 €** bruto/god (6.450 €/mes) —
    [check24](https://www.check24.de/private-krankenversicherung/versicherungspflichtgrenze/)
  - **2027: ~84.483 €** bruto/god (~7.040 €/mes), skok od 9,2% —
    [PKV-Verband](https://www.pkv.de/verband/presse/meldungen/versicherungspflichtgrenze-wechsel-in-die-pkv-wird-weiter-erschwert/)

  Njegovih trenutnih 78.000 € prelazi prag za 2026, ali **pada ispod 2027 praga**.
  Ranija donja granica od **75.000 € nikad nije prelazila prag** — bila je ispod već za
  2026. Ta cifra je greška i ne sme se koristiti u pregovorima.

  **Pošto počinje tek po isteku ugovora (v. „Dostupan od" niže), merodavan je JAEG za tu
  godinu** — dakle ~84.483 €. Otuda 85.000 €: to je prvi okrugao broj iznad JAEG-a za 2027,
  pa `ab 85.000 €` znači „ne pregovaram ispod PKV praga", a ne proizvoljnu cifru.

  *Prag raste svake godine. Kad se pojavi JAEG za 2028, proveri da li 85.000 € i dalje
  stoji iznad njega — ako ne, broj gore se menja.*

  > **Vlasništvo nad brojem je 07.08.2026. prešlo ovamo.** Ranije je stajao u
  > `podesavanja.json` → `plata.pragEur`, jer je pipeline filtrirao po njemu. Pipeline više
  > ne filtrira po plati, pa broj tamo nema šta da traži — **ovaj fajl sada drži i „zašto"
  > i „koliko"**, a jedini potrošač je `../cover-letter/initiativbewerbung.md`
  > (`Gehaltsvorstellung`). Ne vraćaj ga u `podesavanja.json`.

  > **Nije pravni savet i treba proveriti kod PKV savetnika/Steuerberater-a pre potpisa:**
  > ako je već u PKV, pad ispod praga načelno vraća u obavezno GKV osiguranje, ali se to
  > može izbeći kroz *Befreiung von der Versicherungspflicht* — zahtev u roku od **3 meseca**.
  > Kako se to ponaša pri **promeni poslodavca** nisam potvrdio, a to je baš njegov slučaj.
  > **Pitaj ga da li je ovo proverio pre nego što se plata zaključa u pregovoru.**

  *Prag raste svake godine — uvek proveri aktuelni iznos pre nego što ga navedeš kao broj.*
- **Samo full remote. Tvrd zahtev, bez izuzetka — i to je JEDINI tvrd uslov oko lokacije.**
  Nijedan dan u kancelariji — ni „1 day per week", ni „2 days", ni berlinski hybrid. Živi u
  Berlinu, ali to ne otvara hybrid pozicije. *(Potvrđeno 27.07.2026 — ranija beleška da je
  berlinski hybrid izvodljiv bila je pogrešna.)*

  **Putovanja: ne.** *(potvrđeno 07.08.2026: „Putovanja ne, samo REMOTE hard requirement".)*
  Ne pristaje na rolu u kojoj je odlazak kod klijenta ili na lokaciju redovan deo posla —
  ni kao „occasional travel", ni kao „~20% travel", ni kao onsite kickoff po kvartalu.
  Ovo je posebno bitno za **pre-sales role**, gde je putovanje kod prospekta podrazumevano
  i retko piše u oglasu; v. „Nijansirano / Pre-sales".

  > **Ne izmišljaj treću osu.** Remote je uslov, putovanja su njegova posledica — ne vodi
  > ih kao odvojen kriterijum i ne pitaj ga više „koliko dana mesečno je granica".
  > Odgovor je nula. Ako oglas traži putovanja, pao je na remote.
- **Ne želi zaključano okruženje sa nadzorom uređaja** — JAMF, Jamf Protect, Defender for
  Endpoint, CrowdStrike kao režim rada. Praktičan razlog jači od preference: tamo se
  blokiraju eksterni AI alati, pa mu otpada ceo diferencijator. Kako se ovo primenjuje
  bez odbacivanja celog tržišta — v. sekciju 3 u `SKILL.md`.
- **Lokacija: Berlin.** EMEA i evropske vremenske zone su bez problema. Nemački ugovor je
  relevantan zbog PKV praga.
- **EOR je prihvatljiv** *(potvrđeno 31.07.2026)* — strana firma bez nemačkog entiteta koja
  zapošljava preko Employer of Record-a (Deel, Remote.com, WorkMotion) **prolazi**, jer EOR
  daje nemački ugovor i Arbeitgeber-Sozialversicherung, pa PKV prag ostaje pokriven.
  Ovo otvara remote-first firme, gde je bazen full-remote poslova najveći.
  *Šta i dalje pada: čist strani ugovor bez nemačkih doprinosa, i contractor/freelance
  aranžman umesto Festanstellung.*
- **Dostupan od 01.01.2027.** Ugovor sa Cognizant Netcentric ide do **31.12.2026**, raskid na
  njegov zahtev. U nemačke prijave ide kao `frühestmöglicher Eintrittstermin: 01.01.2027`.
  *Posledica: ima pistu, nije pod pritiskom. Ne prihvata kompromis na tvrdim uslovima.*

## Šta hoće

- Front-end rola koja koristi AI i u kojoj gradi automatizaciju razvoja
- **Lead radije nego čist IC** — na direktno pitanje: čist IC „može, ali nije ideal"
- Naglasak na AI-u mu je bitan (v. napomenu o ulaznici vs. diferencijatoru u `SKILL.md`)
- **Pre-sales / Solutions Engineering ga zanima kao pravac** *(potvrđeno 07.08.2026)*.
  Ne zamenjuje 1–5 sa liste rola, nego se dodaje kao šesta opcija. Posledica za ocenjivanje:
  oglas iz te discipline se **više ne odbacuje kao „druga profesija"** — ocenjuje se po
  pre-sales kriterijumima. *(Ovo NE otvara PM pivot — taj je odbijen 05.08.2026, Adobe.)*
- **AI workflows može, ali sam kaže da nema iskustva da tu bude Lead Engineer.**
  *Njegova rezerva stoji i ne briše se — ali reference letter pokazuje da je enablement
  već radio formalno (DXN curriculum, React CoP). V. „Lead i enablement" gore.
  Rola #2 ostaje na listi; kod prijave se vodi kao „AI-assisted delivery", ne kao
  „AI research lead".*

## Role gde je danas najjači, po redu

1. **Front-end Lead / FE Tech Lead** — senior danas, bez pripreme
2. **AI Enablement / Developer Experience Lead** — BAT priča je retka, malo konkurencije
3. **Design Systems / Design Engineering Lead** — Figma→specs→verifikacija, uska niša
4. **AEM Lead Front-end / Senior FE u AEM domenu** — najveća trenutna tržišna vrednost.
   AEM je **domen**, ne posao: uzimaju se role gde je AEM kontekst a rad je front-end.
5. **IC „FE dev koji koristi AI"**
6. **Solutions Engineer / technical pre-sales u AI ili developer-tooling firmi** —
   *(dodato 07.08.2026, njegova potvrda da ga pravac zanima)*. **Ne rangira se uz 1–5**:
   to je pivot, ne sledeći korak. Konkurentan je samo tamo gde proizvod prodaje inženjerima
   i gde firma prima tehnički background bez pre-sales staža — v. „Nijansirano /
   Pre-sales". Oglas sa „5+ years in pre-sales" kao hard req i dalje pada.

### Titule koje se NE uzimaju

- **Solution Architect / AEM Architect / Software Architect** — *(odluka Zorana,
  31.07.2026)*: „daleko sam ja od arhitekte, nemam dovoljno znanja iz bekenda a za arhitektu
  se uglavnom traži full stack." Ovo je **hard filter na naslov role**, ne procena veštine.
  Oglas sa „Architect" u nazivu se odbacuje bez ocene, osim ako opis eksplicitno kaže
  front-end architecture i ne traži backend.

  > **Suženo 07.08.2026 (Unframe oglas).** Filter važi za **inženjerske** Architect role —
  > one gde se od tebe traži da projektuješ sistem i odbraniš backend odluke. To je i bio
  > njegov razlog. **Ne važi za pre-sales naslove** („AI Transformation Architect",
  > „Solutions Architect" u sales organizaciji), gde je „Architect" prodajni naslov bez
  > projektantske odgovornosti — demo, discovery, tumačenje tuđe platforme. Takav oglas se
  > **ocenjuje**, ne odbacuje na naslov. Razlikuješ ih po odgovornostima, ne po nazivu:
  > ako u „What You'll Do" stoje Account Executive, demo, prospect, discovery — pre-sales je.
- **AEM Developer / AEM Engineer bez „front-end" u opisu** — u AEM svetu ta titula
  podrazumeva **Java, OSGi, Sling, Maven, CRXDE**. To nije njegov stack i pada na tehničkom
  screeningu. Traži se „**Frontend Entwickler AEM**", „AEM Front-end Developer",
  „Front-end Lead" — ili opis u kome je frontend eksplicitan.

---

## Otvorena pitanja — popuni pa obriši odavde

Stvari koje menjaju ocenu oglasa, a odgovor još nije upisan. **Pitaj ih u koraku 3, ne
pretpostavljaj.**

1. **Shopify filter projekat — datum i klijent.** *(Magento deo ovog pitanja je zatvoren
   31.07.2026 iz reference letter-a: BAT, 2023–2025 — v. sekciju React. Ostaje samo
   Shopify, koji letter ne pominje.)*
2. **TypeScript — oštrenje, ne provera.** TS stoji u „Ima" i tako ostaje. Ali za intervju
   vredi imati spreman konkretan primer: generici, discriminated unions, tipovanje hookova
   i propsa. Nije rupa; nedostaje mu samo priča uz tvrdnju.
3. **Vitest ili Jest** — koji je stvarno koristio za unit testove.
4. **AI Enablement Lead — delimično rešeno 31.07.2026.** Reference letter dokazuje formalni
   enablement rad (DXN curriculum, React Community of Practice, 2 tima / 7 developera), pa
   samoprocena „nemam iskustva da budem Lead" jeste preoštra za *enablement*. Rola #2 ostaje.
   **Ostaje otvoreno samo:** hoće li ići na role koje traže AI **strategiju** za celu firmu
   (evaluacije modela, budžet, governance) — to nije radio i to treba pitati pre prve takve
   prijave.

5. **Adobe certifikacija — da ili ne?** Nema nijednu Adobe sertifikaciju, a Trek B je AEM.
   U in-house oglasima se retko traži; kod agencija/partnera nosi težinu jer im ulazi u
   partner status. Ako ostane bez ponude do oktobra 2026, ovo je najjeftiniji potez.

6. **Portfolio vizuelnog rada — postoji li?** *(otvoreno 06.08.2026, Jobgether oglas.)*
   Na pitanje o vizuelnom sudu odgovorio je „expert" — što je upisano u „Ima". Ali pitanje
   je imalo dva dela i drugi je ostao bez odgovora: **ima li 2–3 sajta koja može da pokaže
   kao lepa, a ne samo tehnički korektna?** Za Design Engineer role (rola #3 sa njegove
   liste) portfolio je prvi filter, pre CV-a. Bez njega ta cela kategorija oglasa ostaje
   ispod 50% bez obzira na tehnički match.

7. **Accessibility — jedan konkretan primer za intervju.** Tvrdnja „expert" stoji i ne
   proverava se ponovo. Nedostaje priča uz nju: koji projekat, koji WCAG nivo, je li a11y
   bio u CI-ju ili u definition of done. Isti tip stavke kao TypeScript (#2) — oštrenje,
   ne sumnja.

8. **Pre-sales i OTE — pregovaračka napomena, ne filter.** *(07.08.2026.)*
   *(Prvi deo ovog pitanja — koji broj ide u `Gehaltsvorstellung` — zatvoren je istog dana:
   **85.000 € ostaje**, sada kao traženi iznos a ne kao prag. V. § Uslovi.)*

   Ostaje da zna pre nego što uđe u pregovor za pre-sales rolu: tamo se plaća kao
   **OTE = base + variable**,
   tipično 70/30 ili 80/20. **OTE od 85.000 € znači bazu od ~60–68.000 €.** Za PKV se
   računa `regelmäßiges Jahresarbeitsentgelt` — varijabilni deo ulazi samo ako je
   garantovan/redovan, a provizija po kvoti po pravilu nije. Dakle OTE koji zvuči dovoljno
   može da ga izbaci iz PKV-a. **Ovo se ne koristi da se oglas odbaci**, nego da zna šta
   da pita kad dođe do brojki. *Isti caveat kao gore: proveri kod PKV savetnika.*

*(Pitanje #9 o putovanjima je zatvoreno istog dana kad je otvoreno — 07.08.2026, odgovor
„putovanja ne". Upisano u § Uslovi, ne pita se ponovo.)*

10. **„15+ years in IT" — proveri broj.** *(otvoreno 13.08.2026.)* Stoji na oba master
    CV-a. Prva profesionalna rola je januar 2012 (Innovagency, Lisabon), što je 14g 7m na
    dan 13.08.2026. „15+" je tačno samo ako računa nešto pre 2012 — studentski rad,
    freelance, praksu. Ako ne računa, formulacija je „14+ years" ili „over a decade".
    **Menja tekst na oba CV-a**, pa vredi rešiti pre prve prijave.

11. **Sertifikati — § Ima ih nabraja 6, CV-evi 9.** *(otvoreno 13.08.2026.)* Oba master
    CV-a navode „Model Context Protocol: Advanced Topics (Anthropic, 2026)", „Building with
    Claude API (Anthropic, 2026)" i „Claude Code – The Practical Guide (Udemy, 2026)", kojih
    nema u § Jezici i alati. Najverovatnije je lista ovde prosto zastarela, ali dok se ne
    potvrdi, tri sertifikata na CV-u nemaju izvor u profilu. *Ako su tačni — upiši ih u
    § Jezici i alati i zatvori ovo pitanje.*

12. **Reference letter — koje ime firme stoji na potpisanom dokumentu?** *(otvoreno
    13.08.2026.)* § Lead i enablement kaže „CEO **Netcentric** Deutschland GmbH", a oba
    master CV-a pišu „CEO of **Cognizant Netcentric** Deutschland GmbH". Potpisan dokument
    se citira po imenu i ta dva se moraju složiti. *Proveri u
    `assets/Reference_Letter_ZoranMarkovic.pdf` i poravnaj profil sa dokumentom, ne
    obrnuto.*

13. **`assets/linkedIn-aboutMe.md` — „led and mentored distributed teams of up to 40
    engineers".** *(otvoreno 13.08.2026.)* Ista greška koja je tog dana ispravljena na oba
    CV-a: **7 developera je formalna odgovornost, 40 inženjera je uticaj** (v. § Lead i
    enablement). „and mentored" ublažava, ali ne rešava — glagol „led" i dalje stoji uz broj
    40. Ovo je tekst koji regruteri stvarno čitaju. *Ide kroz `optimize-profile`; ovde stoji
    samo da se ne izgubi.*
