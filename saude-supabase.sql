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
-- recordes de corrida: prova '5k', '10k', '21k' ou 'longa' (corrida mais longa)
create table if not exists public.saude_recordes (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  prova text not null,
  distancia_km numeric not null,
  tempo_s int not null,
  dia date,
  updated_at timestamptz not null default now(),
  primary key (user_id, prova)
);
-- avaliações físicas (composição corporal e 7 dobras); metas em saude_metas com chave 'av_<campo>'
create table if not exists public.saude_avaliacoes (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  dia date not null,
  peso numeric, imc numeric, gordura numeric, massa_gorda numeric, massa_magra numeric, cintura numeric, quadril numeric,
  suprailiaca numeric, peitoral numeric, subescapular numeric, tricipital numeric, axilar numeric, abdominal numeric, coxa numeric,
  updated_at timestamptz not null default now(),
  primary key (user_id, dia)
);
-- dieta: alimentos cadastrados (por 100 g/ml) e diário (cada alimento comido, com kcal/proteína por 100 copiados)
create table if not exists public.saude_alimentos (id uuid primary key default gen_random_uuid(), user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  nome text not null, kcal numeric not null default 0, prot numeric not null default 0, unidade text not null default 'g', porcao numeric, created_at timestamptz not null default now());
create table if not exists public.saude_dieta (id uuid primary key default gen_random_uuid(), user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  dia date not null, refeicao smallint not null, nome text not null, qtd numeric not null, unidade text not null default 'g',
  kcal100 numeric not null default 0, prot100 numeric not null default 0, alimento text, ordem numeric not null default 0, created_at timestamptz not null default now());
-- meta da dieta em saude_metas: chave 'dieta', valor = kcal, extra = proteína (g)
