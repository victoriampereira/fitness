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

Menu de baixo: **Hoje · Planos · Mês · Peso · Estatísticas**. O endereço continua o mesmo (/fitness/).

- **Hoje:** data e "semana N do plano", seguidas de três quadros um embaixo do outro:
  - **Peso:** último peso, variação desde o início (média de 7 dias) e "%" da meta com barra. Mostra só "40%", sem "do caminho". Tocar abre a aba Peso.
  - **Isotretinoína (Lembrete):** fundo preto, título "Lembrete" e só um círculo de check. Aparece só no dia da dose: 1 cápsula a cada 3 dias, contados a partir da última marcada. Se não marcar, continua aparecendo nos dias seguintes. Depois de marcado, fica visível (rosa) só naquele dia. Não aparece no Mês, por decisão da Victoria. Só aparece para quem tem a linha `remedio` em `saude_metas`.
  - **Treinos de hoje:** itens do Plano do dia, sem bolinhas. Quando marcados na aba Planos (ou lançados), ficam riscados no meio. Mostram os minutos da escada e os km da corrida: o real, se lançado; senão, o previsto. Tocar abre Planos. Sem texto ao lado do título.
- **Planos:** o plano de sempre. No topo ficam os botões "Conversor de pace" e "Atividades", que abrem essas telas, cada uma com "‹ Planos" para voltar. As antigas abas Semana, Atividades e Conversor saíram do menu.
- **Mês:** igual ao que já era. Não inclui a isotretinoína.
- **Peso (opção B):**
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
