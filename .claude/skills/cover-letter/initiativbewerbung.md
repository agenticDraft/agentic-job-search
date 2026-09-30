# Initiativbewerbung — hladan mejl firmi bez otvorenog oglasa

Dopuna `SKILL.md`. Sva pravila iz njega važe — voice, honesty pass, jedna strana, render.
Ovde je samo ono što je **drugačije** kad nema oglasa.

Koristi se kad je firma u `job-search-manual/lista-oglasa.md` označena kao **INITIATIV**.
Ako firma ima otvoren oglas, ovo se ne koristi — ide normalan `SKILL.md` tok.
Hladan mejl kad oglas postoji zaobilazi ATS i čita se kao da oglas nije pročitan.

## Šta se menja u odnosu na cover letter

`SKILL.md` korak 2 kaže: „nađi rečenicu iz oglasa koja se može odgovoriti." Nema oglasa,
pa nema te rečenice. **Zamena: otvara se njihovim poslom, ne njegovim CV-jem.**

Konkretno — jedan njihov projekat, klijent ili tehnički izbor koji možeš da imenuješ.
Case study sa njihovog sajta, brend koji su radili na AEM-u, konferencijski talk.
Bez toga mejl je spam, i tako se čita.

> **eggs unimedia** su radili HUK-COBURG AEM platformu. To je otvaranje.
> „Video sam da radite AEM" nije — to važi za svaku firmu na listi.

**Ako ne nađeš takvu kotvu za tu firmu — ne piši mejl.** Skini je sa liste.
To je i razlog zašto je lista 8–12 firmi a ne 30.

## Nemački format — bez ovoga se ne čita

Nemački HR očekuje fiksni skup. Ako nedostaje, prijava se vraća ili ignoriše:

- **Anschreiben** — pismo (ovo što pišeš)
- **Lebenslauf** — CV
- **Zeugnisse** — `assets/Reference_Letter_ZoranMarkovic.pdf`.
  Ocena 1, potpisao CEO Netcentric Deutschland. **Najjača karta u paketu.**
  U nemačkom procesu se Arbeitszeugnis traži po difoltu i čita se pažljivo.
- **`Frühestmöglicher Eintrittstermin`** — datum pročitaj iz
  `../job-match/candidate-profile.md` § Uslovi („Dostupan od …"), gde stoji i zašto
  (kad ističe ugovor sa Netcentric-om). Piše se kao činjenica, ne kao izvinjenje.
  Imam i turbo klauzulu 
- **`Gehaltsvorstellung`** — v. sekciju niže. Ne preskače se; izostanak deluje kao izbegavanje.

Zadnja dva idu u **telo mejla**, ne u pismo — pismo ostaje pismo. Zeugnisse se pomenu
u pismu jednom rečenicom da su u prilogu.

## Gehaltsvorstellung — broj, i zašto baš taj

**Piši `ab <prag> € brutto jährlich`.**

**Broj pročitaj iz `../job-match/candidate-profile.md` § Uslovi.** To je jedino mesto gde
stoji kao vrednost — ne pamti ga i ne prepisuj ga ovde. Tamo je i razlog zašto je baš
toliki (JAEG po godinama, izvori).

> **Vlasnik je promenjen 07.08.2026.** Ranije je stajao u `podesavanja.json` →
> `plata.pragEur`, jer je pipeline filtrirao po njemu. **Plata više ne filtrira oglase**,
> pa je `plata.pragEur` uklonjen — ne traži ga tamo. `Gehaltsvorstellung` je od sada
> čisto pregovaračka stavka i jedini razlog zašto broj uopšte postoji.

- **Ne piši 75.000 €.** Ta cifra je u starim beleškama i **greška je** — ispod je JAEG-a
  i za 2026.
- Ne piši raspon sa donjom granicom ispod praga. U nemačkom pregovoru donja granica raspona
  postaje ponuda.
- `ab …` (od) je standardna formulacija i ostavlja prostor naviše.
- **Proveri aktuelni JAEG pre svakog novog kruga prijava** — menja se svake godine.

## Remote — pitanje, ne zahtev

Full remote mu je tvrd uslov, ali u hladnom mejlu se ne postavlja kao ultimatum.
Kod većine firmi sa liste remote politika **nije javno objavljena**, pa je ovo ujedno
i način da se sazna pre nego što se potroši trud.

Formulacija koja radi — činjenica pa pitanje, u jednoj rečenici:

> I work fully remote from Berlin and have done for years. Is that something your team
> can accommodate? If not, I'd rather know now than take up your time.

Zadnja polurečenica nije ljubaznost. Ona je razlog zašto na ovo odgovore.

## Struktura mejla

Pismo ide **u prilogu kao PDF**, a telo mejla je kratko i nosi formalne stavke:

```
Betreff: Initiativbewerbung Senior Frontend Engineer — <odakle si čuo za njih>

Guten Tag <ime ako ga imaš, inače: Sehr geehrte Damen und Herren>,

<2–3 rečenice: ko si, šta te dovodi baš kod njih — ista kotva kao u pismu, kraće>

Frühestmöglicher Eintrittstermin: <datum iz candidate-profile.md § Uslovi>
Gehaltsvorstellung: ab <broj iz candidate-profile.md § Uslovi> € brutto jährlich

Im Anhang finden Sie mein Anschreiben, meinen Lebenslauf und mein Arbeitszeugnis.

Mit freundlichen Grüßen
Zoran Markovic
Phone: +491702236916
Email: markonimobile@gmail.com 
GitHub: github.com/zmarkoni
```

**Neofonie izričito traži da u subject liniji piše odakle si čuo za njih** — proveri da li
i druge firme sa liste imaju takav zahtev pre slanja.

I found your company via google search

## Jezik

Telo mejla i formalne stavke — **nemački**, kao gore. Pismo — **engleski**.

Razlog: njegov nemački nije na nivou na kom bi pisao pismo od 2000 karaktera koje treba
da zvuči kao on, a loš nemački u pismu šteti više nego engleski. Nemački u telu mejla
pokazuje da poznaje proces. Većina AEM agencija radi međunarodno i engleski im je radni jezik.

Ako firma **eksplicitno** traži prijavu na nemačkom — reci mu, ne prevodi pismo sam.

## Šta ide u pismo

Ista struktura kao `SKILL.md` § Letter structure, sa dve izmene:

- **Otvaranje** — njihov projekat, ne „I am writing to apply". Nema oglasa da se citira.
- **Honesty sekcija** — obično **otpada**. Nema oglasa, dakle nema imenovanog zahteva koji
  ne ispunjava. Ne izmišljaj rupu da bi pismo delovalo pošteno.
  *Izuzetak:* ako je firma očigledno Java/backend AEM shop, jedna rečenica da je
  front-end njegova strana AEM-a — bolje sada nego u trećem krugu.

Za Trek B pismo se oslanja na AEM staž i lead dokaze iz reference letter-a. Za Trek A
na BAT delivery harness. Ne mešaj oba u isto pismo — firma sa liste je u jednom treku.

## Fajlovi

- **Pismo** — `job-search-manual/prijave/<n>.<Firma> - Initiativbewerbung.md` → isti pandoc/typst
  render kao u `SKILL.md` § Rendering
- **Telo mejla** — dodaje se u isti fajl **ispod `---` separatora**, posle YAML-a, pod
  naslovom `## Email body (ne renderuje se)`

  > **Pažnja:** `SKILL.md` § Fajlovi kaže da se sve iz body-ja renderuje u PDF. Zato telo
  > mejla ide u **zaseban fajl** `<n>.<Firma> - email.md`, a ne u izvor pisma.
  > Renderuj pa proveri da u PDF-u nema tela mejla.

- `<n>` nastavlja globalnu numeraciju iz `job-search-manual/` — trenutno od **12**

## Verifikacija

Sve iz `SKILL.md` § Verify, plus:

1. **Kotva na firmu je u prvom pasusu i imenovana je.** Ako pismo radi za bilo koju drugu
   firmu sa liste — nije gotovo. Ovo je jedini test koji stvarno razlikuje Initiativbewerbung
   od spama.
2. `Gehaltsvorstellung` je **pročitan iz `candidate-profile.md` § Uslovi**, nije napamet upisan,
   i JAEG je proveren za tekuću godinu.
3. `pdftotext "<fajl>.pdf" -` ne sadrži telo mejla ni `Betreff:`.
4. Prilozi su sva tri: pismo, CV, Arbeitszeugnis.
