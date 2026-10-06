# linkedin-mail-jobs

- **Link:** nema — LinkedIn se ne skrejpuje; izvor su job-alert mejlovi u Gmail-u
- **Tip:** stubovi bez punog opisa, dopunjuje ih skill `linkedin-mail-jobs`
- **Prozor:** filter u kodu po `postedAt`; stub bez `postedAt` ostaje (datum mejla nije datum objave)
- **Izlaz:** `job-search-automation/linkedin-mail-jobs/` (pali na bloker: `linkedin-mail-jobs/proveriti/`)
- **Kod:** `src/search/linkedin-mail-jobs.mjs`, `fromLinkedinMailJobs` u `src/normalize.mjs`
