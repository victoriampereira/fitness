# Saúde (antigo Fitness): anotações do projeto

Resumo do que já foi combinado sobre o app, para retomar o trabalho em qualquer conversa nova.
**Para o Claude:** leia este arquivo antes de mexer no app e atualize-o sempre que uma decisão nova for tomada.

Última atualização: 16/11/2026 (app virou "Saúde")

## Onde as coisas ficam

- **App:** https://victoriampereira.github.io/fitness/ (GitHub Pages, repositório `victoriampereira/fitness`, branch `main`).
- **Código:** tudo em um único arquivo, o `index.html`. O `sw.js` guarda o app no celular para abrir rápido. A cada versão nova, o número de `CACHE` em `sw.js` sobe (hoje está em `fitness-v66`).
- **Dados e login:** Supabase, no mesmo projeto do Casa Nova (`ufbmhikchqhstcbhioib`). Tabelas:
  - `fitness_dias`: o que foi feito em cada dia (pernas, superiores, abdômen, km, escada, pace, sensação e atividades extras)
  - `fitness_checks`: treinos do plano marcados, trechos e ajustes de km/tempo
  - `fitness_adjust`: ajustes automáticos de cada semana
  - `fitness_moves`: treinos arrastados de dia, reordenados ou excluídos
  - `fitness_nomes`: nomes editados das corridas
  - `fitness_perfil`: cadastro dos outros usuários
  - `saude_registros`: peso, isotretinoína e VO2 (campo `tipo`)
  - `saude_tacf`: semestres do TACF
  - `saude_metas`: metas de peso, VO2 e TACF; a linha `remedio` liga o lembrete (valor = intervalo em dias)
- **Commits:** autor "Victoria Pereira". Cada mensagem descreve a mudança em português.

## Abas (desde 16/11/2026)

Menu de baixo: **Hoje · Plano · Mês · Peso · Estatísticas** (a aba "Planos" virou "Plano" em 16/11). O endereço continua o mesmo (/fitness/).

- **Hoje (opção B, escolhida em 16/11):** cartões menores e claros (#F7F7F7) com ícones de 18 px. No topo, a data e "semana N". Depois três quadros, um embaixo do outro:
  - **Peso:** último peso, variação desde o início (média de 7 dias) e "%" da meta com barra. Mostra só "40%", sem "do caminho". Tocar abre a aba Peso.
  - **Isotretinoína (Lembrete):** cartão claro com o título "Lembrete" e um círculo rosa de check. Aparece só no dia da dose: 1 cápsula a cada 3 dias, contados a partir da última marcada. Se não marcar, continua aparecendo nos dias seguintes. Depois de marcado, fica visível (rosa) só naquele dia. Não aparece no Mês, por decisão da Victoria. Só aparece para quem tem a linha `remedio` em `saude_metas`.
  - **Treinos de hoje:** itens do Plano do dia, sem bolinhas. Quando marcados na aba Planos (ou lançados), ficam riscados no meio. Mostram os minutos da escada e os km da corrida: o real, se lançado; senão, o previsto. Tocar abre Planos. Sem texto ao lado do título.
- **Planos (opção B):** o plano de sempre. No topo ficam dois ícones redondos finos, Conversor (⇅) e Atividades (onda), e "Editar plano" como link sublinhado. Eles, que abrem essas telas, cada uma com "‹ Planos" para voltar. As antigas abas Semana, Atividades e Conversor saíram do menu.
- **Mês:** igual ao que já era. Não inclui a isotretinoína.
- **Peso (opção E, escolhida em 16/11; o cartão descrito abaixo foi substituído):** três números entre linhas finas (atual, meta e falta; tocar na meta edita), "no ritmo atual, meta por volta de…", "hoje · outro dia", − peso + com fonte fina e "salvar" como link, seguidos do gráfico. Sem lista de pesagens. Versão antiga:
  - Cartão da meta: meta, prazo, início, barra com "% do caminho", kg desde o início, kg para a meta, kg por semana (regressão linear dos últimos 28 dias) e "No ritmo atual, você chega à meta por volta de…".
  - Lançamento com − e + de 0,1 kg e botão "Salvar" delicado (só contorno). "outro dia" permite lançar ou corrigir dias passados.
  - Gráfico de 30 dias com pontos, média de 7 dias, linha tracejada da meta e projeção.
  - Lista das últimas pesagens.
- **Estatísticas:** só VO2 máx e TACF, sem textos laterais além de "meta X".
  - **VO2:** a Victoria lança hoje e atualiza todo mês. Mostra o valor, a data (só "16/11") e "próxima: dd/mm". Sem "faltam X" e sem "Atualizar todo mês". Tem meta e gráfico em degraus, que aparece a partir do 2º lançamento.
  - **TACF:** última pontuação, conceito, barras por semestre com a linha da meta e "ver tudo ›". Sem "definir meta" no cartão: a meta é definida na tela do TACF. O formulário de lançamento é compacto, em duas colunas, com os pontos por prova em uma linha.
- **TACF (tela):** "‹", título e um "+" pequeno e delicado. Embaixo, a meta (pts e corrida) e quanto falta. Não tem o resumo melhor/último.
  - Cada semestre mostra a corrida em destaque; abaixo, flexões, abdominais, cintura e peso.
  - Tocar abre a pontuação por prova e "editar este semestre".
  - O histórico de 1/23 a 2/26 veio da planilha da Evolução Corporal.

## Visual

- Minimalista, fundo branco e texto quase preto. Prévias de layout: imagem PNG com as opções lado a lado (Opção A/B/C).
- O título agora é "saúde". O ícone continua o "fit".
- O título "fitness" fica em minúsculas, na fonte Raleway extra fina, com letras bem espaçadas. Os textos usam Manrope e Inter.
- O ícone é "fit" escrito em Raleway.
- Não mostrar contagens nem textos repetidos. As mensagens de feedback e o "Como foi?" foram removidos de propósito.

## O plano da Victoria (modo "legado")

- **Início:** segunda, 19/10/2026 (semana 1), com teste de Cooper de **1.760 m** em 12 min.
- **Recalibração de 22/10:** as corridas de 3,51 km a 7:08 e 3,67 km a 6:49 equivalem a cerca de **1,84 km no Cooper**. Vale a partir da semana 2.
- **Replanejamento de 07/11:** feito a partir das semanas 1 a 3 (15,1 km na semana 3, tiros de 400 m em cerca de 2:02, leves de 6:24 a 6:58). O volume é sempre crescente.
- **Meta 1:** **prova de 7,5 km em 31/12/2026** (semana 11), a **5:50/km** (43:45). Estratégia: 1º km a 6:00, depois segurar 5:48 e acelerar no último km se sobrar.
- **Meta 2 (desde 10/11):** **meia maratona de 21,1 km em 29/05/2027** (semana 32), em **2h15** (6:24/km). Estratégia: 3 primeiros km a 6:35, depois segurar 6:22 e acelerar nos últimos 3 km se sobrar.
- **Fases:** Volta aos treinos → Base → Construção → Pico → Prova de 7,5 km → Base da meia → Construção → Específico → Pico → Polimento → Semana da meia.
- **Semana típica:** 3 corridas (leve, treino de qualidade e longão), 3 sessões de escada, 2 de inferiores, 2 ou 3 de superiores e 2 de abdômen. O domingo é de descanso.
  - Evitar pernas ou escada na véspera do longão.
  - A corrida e a escada ficam sempre por último no dia.
- **Escada:** recalibrada em 09/11 a partir da semana 4, sempre crescendo. Da semana 12 em diante ganha +1 min por semana, até 30 min por sessão.
- **Longão da meia:** de 10 km até 19 km, subindo 0,5 km por semana. O total da semana cresce até a semana 30.

## Regras automáticas

- **Virada de semana:** a semana corrente vira a próxima **no domingo às 18h**. No mesmo horário sai o ajuste automático da semana seguinte.
- **Semana fechada:** a semana conta como fechada quando já passou, quando é o domingo dela ou quando todas as corridas foram feitas.
- **Ajuste semanal da corrida:**
  - pulou mais de 1 treino → ritmos 5 s/km mais leves;
  - correu em média 10 s/km ou mais abaixo do previsto → ritmos 5 s/km mais rápidos;
  - correu em média 15 s/km ou mais acima do previsto → ritmos 5 s/km mais leves;
  - sem pace lançado → ritmos mantidos.
- **Ajuste semanal da escada:**
  - fez mais que o previsto em 2 ou mais sessões → +1 ou +2 min por sessão;
  - ficou abaixo do previsto em 2 ou mais sessões → −1 min por sessão.
- **Campos de pace e tempo:** aceitam só números e colocam os dois pontos sozinhos (215 vira 2:15).
- **Trechos no iPhone:** o valor salva ao sair do campo.

## Outros usuários

- Quem entra pela primeira vez passa por um cadastro. Ele pede nome, idade e sexo, o Cooper (ou a opção de fazer o teste na 1ª semana), um plano de 8 ou 12 semanas, o objetivo (prova ou condicionamento) e as atividades extras.
- O plano é gerado pelo nível no Cooper, pela tabela clássica por idade e sexo. Pode ser refeito em "Refazer plano".
- O plano da Victoria é o modo "legado", sem cadastro.

## Histórico

A lista completa de mudanças está nos commits do repositório (`git log`), de 16/10/2026 em diante.

## Ajustes de 16/11 (noite)

- **Hoje:** sem "semana N". Nos treinos, o tempo e os km aparecem logo ao lado do nome (ex.: "Escada 13 min").
- **Planos:** o botão "Editar plano" agora se chama "Editar".
- **Peso:** sem − e +. O peso fica centralizado e só se atualiza digitando.
- **Estatísticas:**
  - O título passou a ser "VO2 máximo". A meta aparece como etiqueta à direita do valor, no mesmo estilo do "Bom" do TACF; tocar nela edita a meta.
  - No TACF, abaixo das barras, só aparece "ver tudo ›".
- **TACF:**
  - Sem "corrida" ao lado dos metros e sem a frase "Toque num semestre…".
  - O formato padrão de cada semestre é "24F 46A 65cm 63,45kg".
  - Não há mais "Definir meta". O "+" abre o lançamento com a escolha entre TACF e Meta.
  - A meta é salva em `saude_tacf` com semestre "Meta". Ela aparece no topo da lista, em verde clarinho, com o rótulo "Meta", e a linha da meta nas barras usa os pontos dela.
- **TACF automático:** ao digitar corrida, flexões, abdominais e cintura no lançamento (TACF ou Meta), o app calcula os pontos de cada prova, a nota final e o conceito pela NSCA 54-3/2026.
  - Tabelas e regras em `tacf-calc.js`, copiadas da calculadora https://camposfmc.github.io/TACF/ (repositório camposfmc/TACF).
  - A idade vem de `saude_metas` 'nascimento' (04/07/1998) e o sexo de 'sexo' (1 = F). A altura, usada na nota da cintura, é pedida no primeiro lançamento e fica em 'estatura'.
  - Conferido com os semestres 2/26 (56,7 B) e 1/26 (88,1 MB): bate certinho.
  - Os semestres antigos não são recalculados; o cálculo só acontece ao digitar.
- **Removidos:**
  - o título "Lançar TACF/Meta" (fica só o seletor TACF/Meta);
  - a linha verde da meta nas barras do TACF;
  - a meta do VO2 (etiqueta e linha);
  - os textos "Toque em um dia…" (Mês), "Toque no círculo…" e a meta da corrida (Planos).

## Ícone, menu e VO2 (16/11, noite)

- **Ícone do app:** opção A, um "s" fino e minúsculo em Raleway 200, preto sobre branco (desde 16/11). Arquivos: `apple-touch-icon-a.png`, `icon-a-192.png`, `icon-a-512.png` e `favicon-a.png`. O iPhone só troca o ícone ao refazer o atalho na tela de início.
- **Menu de baixo (opção C):** ícones e nomes finos e pequenos, em cinza-claro. A aba ativa fica em preto, sem laranja.
- **Gráfico do VO2 (opção E):** linha fina com área clarinha embaixo. Os pontos ficam com o mesmo espaço entre si, independentemente da data. O valor aparece em cima de cada ponto, pequeno e cinza, e as datas só nas pontas.
- **VO2:** sem a linha "próxima: dd/mm". Os lançamentos de teste anteriores a 16/11 foram apagados; ficou só o 40 de 16/11.
- **Altura:** 168 cm, salva em `saude_metas` 'estatura'. O lançamento do TACF/Meta não pede mais a altura.
- **Isotretinoína:**
  - No Hoje, o cartão se chama "Isotretinoína" (antes era "Lembrete"). O círculo marca a dose; tocar no resto do cartão abre a tela da isotretinoína.
  - A tela tem um calendário do mês: rosa cheio para "Tomei", rosa clarinho para "Dia de tomar", contorno no dia de hoje e setas para trocar de mês. Tocar num dia já passado marca ou desmarca a dose. Embaixo aparece a contagem de cápsulas do mês.
  - Os dias previstos seguem a regra de 1 cápsula a cada 3 dias, contados da última dose; se estiver atrasada, a contagem recomeça hoje.
  - As doses de 3, 5, 7, 9 e 11/11 foram importadas do antigo Diário do Roacutan.
- **TACF por conceito (opção B, tons de azul-marinho):** Excelente #1B2C66, Muito Bom #27408B, Bom #6D83C5, Satisfatório #B4C1E6 e Insatisfatório #DADDE6. As cores valem para as barras e para as etiquetas da lista.
  - No cartão de Estatísticas: sem legenda, sem "pts" e sem a etiqueta do conceito. A nota aparece pequena em cima de cada barra.
  - A data (do TACF e do VO2) fica à direita, centralizada embaixo do "+".

## Revisão final (16/11)

- O título "saúde" fica sempre no topo, em todas as abas (antes descia nas abas curtas).
- Aviso de erro: se os dados não carregarem, aparece em vermelho "Não foi possível carregar seus dados…". Fora isso, a linha fica escondida.
- No computador, o check do Plano fica ao lado do ícone e o nome do treino ocupa a largura toda.
- Tocar numa atividade do Plano abre o card de lançamento (km, pace, escada…) de qualquer dia, inclusive futuro. Corrida com trechos abre a tela de trechos.
- No Hoje, tocar num treino abre o lançamento do dia (ou os trechos).
- "e-mail · Sair" aparece só na aba Estatísticas.
- A janela do VO2 não tem mais texto de instrução.
- **Peso dentro de Estatísticas:** a aba Peso saiu do menu, que agora tem 4 abas: Hoje · Plano · Mês · Estatísticas. Em Estatísticas, o primeiro cartão é o Peso: valor, data, minigráfico verde dos últimos 30 lançamentos, "+" e "ver tudo ›", que abrem a tela de Peso com "‹" para voltar. O cartão do Hoje também abre essa tela.
- A isotretinoína aparece só no Hoje, no dia da dose. Não há outra forma de ver o calendário, por decisão da Victoria.
- Peso sem ",0": aparece 66 em vez de 66,0 (`nf1` mostra decimal só quando existe).
- Cartão de Peso em Estatísticas: sem "ver tudo". Tem um gráfico igual ao do VO2 (verde, últimas 14 pesagens). Tocar no valor ou no gráfico abre a tela de Peso; o "+" também.
- Hoje: o cartão "Treinos de hoje" passou a se chamar "Treinos".
- Treinos feitos no Hoje (opção D): ficam em cinza, sem risco, com um ✓ verde fino à direita.
- O rodapé com e-mail e "Sair" foi removido de todas as abas, a pedido da Victoria; não há botão de sair.
- **Recordes (opção A)** em Estatísticas, entre o VO2 e o TACF, com ícone de troféu dourado. É uma lista: à esquerda a prova e a data; à direita o tempo grande e o pace em cinza.
  - O "+" abre o lançamento, com seletor 5 km | 10 km | 21 km | Mais longa, tempo (28:15 ou 1:14:30) e data. Tocar numa marca permite editar ou apagar.
  - Dados na tabela `saude_recordes`.
  - Marcas iniciais: 5 km em 28:15 (5:39/km, 11/10/2025); 10 km em 57:57 (5:48/km, 05/10/2026); mais longa, 11,5 km em 1:14:30 (6:29/km, 08/11/2025).
  - "Mais longa" é calculada sozinha: mostra a maior distância entre os recordes (5 km, 10 km, 21 km, mais longa) e as corridas lançadas no app com pace. Ao lançar os 21 km, eles viram a mais longa até aparecer algo maior. Se a mais longa vier de uma corrida do app, tocar nela abre o lançamento daquele dia.
- **Aviso de recorde novo:** ao lançar uma corrida com pace (pelo card do dia ou pelos trechos), o app confere se ela bate 5 km, 10 km ou 21 km. Vale se a distância ficou entre a da prova e até 10% a mais; o tempo é estimado pelo pace médio.
  - Se bater, aparece "Novo recorde · 5 km" com o tempo e o pace, e o botão Atualizar/Salvar.
  - Se for a corrida mais longa, aparece um aviso "Sua corrida mais longa: X km" (o recorde dela já é automático).
- **Dia de prova no Hoje:** a prova do plano (7,5 km em 31/12 e 21 km em 29/05) aparece em destaque no cartão Treinos, num bloco preto com distância, pace-alvo e estratégia. Tocar abre o lançamento.
- O Mês não tem contorno de peso nem de isotretinoína; os dois foram testados e removidos a pedido da Victoria.

## Escada e Acatenango (definido em 16/11)

- A Victoria vai subir o vulcão Acatenango em **11/12/2026**: subida na sexta, descida no sábado 12/12.
- A escada aumentou a partir de 17/11. Valores em minutos por sessão (o array `ESC`):
  - semana 5: 13 (feito), 18, 20
  - semana 6: 20, 22, 25
  - semana 7: 22, 25, 30 (pico)
  - semana 8: 20, 12 (leve antes da trilha)
  - semana 9: 15, 18, 18 (volta gradual)
  - semana 10: 15, 15, 12
  - semana 11: 10 (prova de 7,5 km)
- Semana 8 tem um layout próprio:
  - seg: inferiores e escada 20
  - ter: 1 km forte e superiores
  - qua: abdômen e escada 12
  - qui: corrida leve, sem pernas
  - sex 11/12: "Subida do Acatenango" (item em destaque)
  - sáb 12/12: "Descida do Acatenango"
  - dom 13/12: longão
- Recordes mais compacto (opção A): linhas mais próximas e tempo em 18 px. A corrida mais longa aparece só como a distância (ex.: "11,5 km") e é trocada quando houver uma corrida maior.
- **Avaliação física** em Estatísticas, logo depois do Peso:
  - O cartão mostra só o % de gordura da última avaliação, com a data (ex.: nov/25), e um gráfico igual ao do peso.
  - Tocar abre a tela no formato de tabela (opção C), com as últimas 3 avaliações lado a lado e a coluna "meta" em verde.
  - Metas só existem para os itens azuis da planilha (peso, IMC, % gordura, massa gorda, massa magra, cintura e quadril). Tocar na coluna da meta define ou edita; ficam em `saude_metas` com chave `av_<campo>`.
  - "Soma das dobras" fica em vermelho; tocar abre as 7 dobras.
  - Tocar na data do topo edita aquela avaliação.
  - O "+" lança uma nova. IMC (pela altura de 168 cm), massa gorda e massa magra são calculados sozinhos se ficarem em branco.
  - Dados na tabela `saude_avaliacoes`. Importadas nov/2024 e nov/2025 (do print da planilha), com dia 01.
- Metas da Avaliação Física calculadas sozinhas:
  - Meta de peso → meta de IMC (peso ÷ 1,68²).
  - Meta de % gordura → metas de massa gorda e massa magra. Usa a meta de peso; sem ela, o peso da última avaliação.
  - Se mudar a meta de peso com % gordura definida, as massas são recalculadas.
- Tela do Peso:
  - O gráfico agora é igual ao do cartão de Estatísticas: pesos reais dos últimos 30 registros, em verde.
  - Saiu a média de 7 dias, a linha da meta e a projeção.
  - "Falta", % da meta e variação usam o último peso lançado (antes usavam a média de 7 dias, por isso não batiam).
- Escada HIIT até o Acatenango:
  - Toda escada de 19/11 a 10/12 virou "Escada · HIIT" de 30 min: 3 blocos de 5 min vel. 5, 2 min vel. 10, 2 min vel. 14 e 1 min vel. 16.
  - As sessões caem em 21/11, 23/11, 25/11, 27/11, 30/11, 2/12, 4/12, 7/12 e 9/12.
  - Tocar abre as bolinhas igual à corrida, com cronômetro ▶ em cada trecho.
  - Ao marcar as 12, lança 30 min de escada no dia.
  - Código: HIIT_DE/HIIT_ATE/HIIT_S e escIv().
- Escada HIIT, velocidade editável:
  - Tocar no "vel. X" (sublinhado pontilhado) muda a velocidade daquele trecho e do mesmo trecho nos blocos seguintes ainda não marcados.
  - Valor alterado fica em negrito. Voltar ao valor do plano desfaz a mudança.
  - Guardado em fitness_checks com item "<id>#<n>#v" (campo vel).
- Plano: semana com todos os treinos feitos fica verde (título e km reais), mesmo antes de virar no domingo às 18h. Classe .wk.fin.
- Aba Dieta (opção E, 5ª aba entre Plano e Mês):
  - Calorias e proteína contra meta fixa. Tocar nos cartões define a meta (saude_metas 'dieta': valor kcal, extra proteína).
  - 4 cartões: Café da manhã, Almoço, Lanche e Jantar.
    - Refeição vazia mostra o que foi comido no último dia com ela (até 14 dias) e o botão "Repetir ontem/de dd/m".
    - "+ incluir" abre a busca. Sem texto, mostra os mais usados daquela refeição.
    - A busca procura nos já usados, nos cadastrados (saude_alimentos) e na TACO (taco.js, 591 alimentos por 100 g/ml).
    - Também dá para buscar online no Open Food Facts ou cadastrar um alimento.
  - Tela da quantidade:
    - Nome editável (para encurtar os nomes da TACO), quantidade em g ou ml, atalhos 50–250 e kcal/proteína ao vivo.
    - Tocar num alimento lançado edita ou apaga.
  - Setas ‹ › na data navegam pelos dias.
  - Dados em saude_dieta (kcal100/prot100 copiados no lançamento). O app carrega os últimos 120 dias.
- Dieta:
  - A busca não recria mais o campo a cada letra: só a lista é atualizada, com atraso de 180 ms. Isso deixava o teclado lento no iPhone.
  - Na tela da quantidade, "alterar" muda kcal/proteína em 100 g/ml. Isso vira (ou atualiza) um alimento seu em saude_alimentos e passa a valer nas próximas vezes, inclusive nos "mais usados".
- Dieta (22/11, pedido dela):
  - Saíram "+ Cadastrar alimento" e "alterar". Os alimentos dela são incluídos por mim direto em saude_alimentos, com os dados dos prints do FatSecret: kcal por 100 = kcal da porção ÷ porção; porcao = medida de costume.
  - Sem busca, a lista mostra "Seus alimentos": os mais usados e depois os cadastrados.
  - Incluídos em 22/11:
    - Leite semidesnatado: 400 ml = 158 kcal.
    - Leite desnatado: 300 ml = 92 kcal.
    - Pão francês: 70 g = 192 kcal.
    - Mussarela: 40 g = 128 kcal.
    - Proteína estimada (leites 3,1 g/100 ml; pão 8; mussarela 22,6), porque o print não mostrava.
- Dieta:
  - Topo virou um círculo: anel verde de kcal (vermelho se passar) e anel azul de proteína, com quanto falta em cada um.
  - Tocar no círculo ou em "meta" define as metas de kcal e de proteína.
  - Alimentos em lista com bolinha verde, quantidade em caixinha e kcal. Tocar abre a quantidade.
  - Incluídos em 22/11: Arroz parboilizado cozido (109 g = 134 kcal, prot. 2,5/100 g) e Ovo inteiro (4 grandes = 294 kcal; registrado como 200 g, 147 kcal e 12,6 g prot./100 g).
- Dieta:
  - Saiu a bolinha verde.
  - Arrastar o alimento para a esquerda mostra o botão vermelho "Excluir" (pointer events, touch-action:pan-y). Tocar fora ou na linha fecha.
- Dieta, medida "un" (unidade):
  - Para esses alimentos, kcal/prot em saude_alimentos e kcal100/prot100 em saude_dieta guardam o valor de 1 unidade (dBase).
  - Atalhos 1–6 em vez de 50–250.
  - Ovo: 1 un = 73,5 kcal e 6,3 g de proteína; costume 4 un.
- Dieta, opção C (22/11):
  - Topo com dois círculos, Calorias e Proteína: consumido no centro e "faltam X" embaixo. O "+" no canto define as metas.
  - Refeições "Café da Manhã/Almoço/Lanche/Jantar" com setinha ao lado do nome (abre e fecha a lista, lembrado em localStorage "dieta-abertas"), kcal à direita e "+" verde.
  - Refeição vazia aberta mostra "Ontem: …" e "Repetir ontem".
- Gráfico do peso com calorias (pkChart), em Estatísticas (14 dias) e na tela Peso (30 dias):
  - Linha verde do peso embaixo. Pontinhos das calorias do dia em cima: azuis dentro da meta, vermelhos acima, com o número na mesma cor.
  - Linha tracejada da meta. O dia de hoje fica de fora até acabar.
  - Começa no primeiro dia com dados.
- Gráfico peso + calorias sem legenda (pedido dela).
- saude_alimentos ganhou a coluna "categoria": Laticínios, Pães e grãos, Proteínas e Frutas.
- Morango incluído: 135 g = 41 kcal.
- A lista por categoria aguarda a escolha da opção.
- Seus alimentos, opção D (22/11):
  - Sem busca, aparecem em blocos lado a lado por categoria (coluna categoria; os sem categoria vão para "Outros").
  - A medida padrão (porcao) dos salvos sempre vale, em vez da última usada:
    - Leites: 100 ml.
    - Mussarela: 30 g.
    - Arroz e morango: 100 g.
    - Ovo: 1 un.
    - Pão: 70 g.
- 22/11: incluídos 10 alimentos do FatSecret:
  - Tangerina (1 un = 37 kcal).
  - Sardinha em óleo (105 g = 191 kcal).
  - Maionese light (12 ml = 21 kcal).
  - Doce de leite (20 g = 63 kcal).
  - Club Social integral (24 g = 102 kcal).
  - Fettuccine à bolonhesa (300 g = 240 kcal).
  - Yopro chocolate (250 ml = 172 kcal).
  - Yopro doce de leite (250 ml = 151 kcal).
  - Requeijão light (30 g = 56 kcal).
  - Iogurte light mamão e laranja (165 g = 68 kcal).
  - Proteína estimada (exceto Yopro: 15 g por 250 ml).
  - Categorias novas: Pratos prontos, Molhos e pastas, Doces e lanches. Ordem no app: Laticínios, Proteínas, Pães e grãos, Frutas, Verduras e legumes, Pratos prontos, Molhos e pastas, Doces e lanches, Outros.

## 22/11 — v108
- Dieta: refeição aberta e vazia não mostra mais "Nada lançado."
- Correção: se o app ficava aberto de um dia para o outro, Dieta e Peso continuavam no dia anterior; agora o "hoje" acompanha a virada da meia-noite (dDiaHj/pesoDiaHj).
- Alimentos salvos (via SQL): Bombom Sonho de Valsa, Ouro Branco (un), Feijão preto temperado cozido (125 g).

## 22/11 — v109
- Ícone da aba Dieta: maçã.
- Dieta: botão "Hoje" ao lado das setas quando está em outro dia.
- Dieta: "Copiar para…" em refeição com itens (escolhe a refeição e o dia, até hoje); dInsert(rows,dia) aceita o dia.

## 22/11 — v110
- Aba Hoje: cartão "Dieta" abaixo do Peso (calorias e proteína de hoje com barras; toque abre a Dieta). Fonte dos números do Hoje (.h-num) reduzida de 24 para 19 px.

## 23/11 — v111
- Gráfico do Peso: o rótulo do primeiro/último ponto vai para baixo do ponto quando a linha chega de cima (antes ficava em cima da linha).

## 24/11 — v112
- Gráfico Peso+calorias (pkChart): faixa do peso com folga para os rótulos (não encosta mais nas calorias nem nas datas); rótulo do 1º/último peso escolhe cima/baixo evitando outros pontos; rótulos de calorias evitam pontos e outros rótulos (cima/baixo) e, em 30 dias, aparecem espaçados. Testado com 600 séries aleatórias sem colisão entre métricas.

## 27/11 — v113
- Tela do treino intervalado: removido o texto "pace · km/h" (ex.: 5:17 · 11,4 km/h) embaixo de cada trecho; fica só o "parado" nos descansos. O previsto continua em cinza dentro do campo.
