-- Saúde: peso, isotretinoína, VO2 máx, TACF e metas (já aplicado no projeto do Casa Nova)
create table if not exists public.saude_registros (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  tipo text not null check (tipo in ('peso','remedio','vo2')),
  dia date not null,
  valor numeric,
  updated_at timestamptz not null default now(),
  primary key (user_id, tipo, dia)
);
create table if not exists public.saude_tacf (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  semestre text not null,
  ordem int not null default 0,
  peso numeric, imc numeric, cintura numeric, cintura_pts numeric,
  flexoes int, flexoes_pts numeric, abdominais int, abdominais_pts numeric,
  corrida_m int, corrida_pts numeric, pontos numeric, conceito text,
  updated_at timestamptz not null default now(),
  primary key (user_id, semestre)
);
-- metas: chave 'peso' (valor = meta kg, extra = peso no início, data = prazo),
-- 'vo2' (valor = meta), 'tacf' (valor = pontos, extra = metros de corrida),
-- 'remedio' (valor = intervalo em dias; só quem tem essa linha vê o lembrete)
create table if not exists public.saude_metas (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  chave text not null,
  valor numeric,
  extra numeric,
  data date,
  updated_at timestamptz not null default now(),
  primary key (user_id, chave)
);
-- RLS: cada pessoa só lê e altera as próprias linhas (políticas "dono le/cria/altera/apaga" nas três tabelas)
