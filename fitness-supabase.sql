-- Fitness: banco de dados (já aplicado no projeto do Casa Nova)
create table if not exists public.fitness_dias (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  dia date not null,
  inf boolean not null default false,
  sup boolean not null default false,
  abd boolean not null default false,
  km numeric not null default 0,
  esc numeric not null default 0,
  updated_at timestamptz not null default now(),
  primary key (user_id, dia)
);
alter table public.fitness_dias enable row level security;
create policy "fitness: dono le" on public.fitness_dias for select to authenticated using ((select auth.uid()) = user_id);
create policy "fitness: dono cria" on public.fitness_dias for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "fitness: dono altera" on public.fitness_dias for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "fitness: dono apaga" on public.fitness_dias for delete to authenticated using ((select auth.uid()) = user_id);
do $$ begin
  alter publication supabase_realtime add table public.fitness_dias;
exception when duplicate_object then null; end $$;
