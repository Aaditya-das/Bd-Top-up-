-- ── Run this in Supabase SQL Editor ──

-- 1. Orders Table
create table if not exists orders (
  id           bigserial primary key,
  order_id     text not null,
  customer_email text not null,
  in_game_name text not null,
  player_uid   text not null,
  topup_label  text not null,
  price        integer not null,
  screenshot   text,
  status       text default 'pending',
  created_at   timestamptz default now()
);

-- 2. Stock Table
create table if not exists stock (
  key      text primary key,
  in_stock boolean default true
);

-- 3. Allow access with anon key
alter table orders enable row level security;
alter table stock  enable row level security;

create policy "allow_all_orders" on orders for all using (true) with check (true);
create policy "allow_all_stock"  on stock  for all using (true) with check (true);
