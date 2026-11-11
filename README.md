# Rent Split Ledger

**Who paid what, and who owes whom**

Who paid what, and who owes whom.

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export via Actions) |

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `rent_split_ledger_expenses` table,
enables row-level security and adds read/insert policies for anonymous users.

## Data model

Table: `rent_split_ledger_expenses`

| Column | Type |
| --- | --- |
| `flatmate` | text |
| `item` | text |
| `amount` | numeric |
| `split_among` | integer |
| `paid_on` | date |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

This repo ships with a GitHub Actions workflow (`.github/workflows/deploy-pages.yml`)
that builds a static export and publishes it to GitHub Pages.

1. Set `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` as repository
   Actions secrets (Settings → Secrets and variables → Actions).
2. Set Pages → Source to **GitHub Actions**.
3. Push to `main`. The workflow builds with `GITHUB_PAGES=1`, which switches
   `next.config.js` to `output: "export"` and adds the repo name as `basePath`.

The site lands at `https://<owner>.github.io/rent-split-ledger/`.

## What it does

- **Per-head maths done for you** — Enter the amount and headcount, get the share.
- **Named flatmates** — No more 'someone paid the bill'.
- **Month by month** — Filter to the month you are settling.

## License

MIT
