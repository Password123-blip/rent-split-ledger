-- Rent Split Ledger — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.rent_split_ledger_expenses (
  id uuid primary key default gen_random_uuid(),
  flatmate text,
  item text,
  amount numeric,
  split_among integer,
  paid_on date,
  created_at timestamptz not null default now()
);

create index if not exists rent_split_ledger_expenses_created_idx on public.rent_split_ledger_expenses (created_at desc);

alter table public.rent_split_ledger_expenses enable row level security;

drop policy if exists "rent_split_ledger_expenses_read" on public.rent_split_ledger_expenses;
create policy "rent_split_ledger_expenses_read" on public.rent_split_ledger_expenses for select using (true);

drop policy if exists "rent_split_ledger_expenses_insert" on public.rent_split_ledger_expenses;
create policy "rent_split_ledger_expenses_insert" on public.rent_split_ledger_expenses for insert with check (true);
