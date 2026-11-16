# Fitness: anotações do projeto

Resumo do que já foi combinado sobre o app, para retomar o trabalho em qualquer conversa nova.
**Para o Claude:** leia este arquivo antes de mexer no app e atualize-o sempre que uma decisão nova for tomada.

Última atualização: 16/11/2026

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
- **Commits:** autor "Victoria Pereira". Cada mensagem descreve a mudança em português.

## Abas

- **Semana / Mês:** diário com bolinhas coloridas. As cores são: inferiores em vermelho, superiores em azul, abdômen em verde, corrida em laranja e escada em roxo.
- **Plano:** agenda semanal com checks, modo de edição (arrastar entre dias, reordenar, excluir), total de km previsto por semana e semanas concluídas em verde com o km real. A semana corrente abre sozinha.
- **Tela de trechos:** uma bolinha por trecho para fartlek, tiros e ritmo. Mostra o pace e a velocidade (km/h) previstos e reais. Tem cronômetro regressivo nos trechos de tempo. Os descansos ficam parados e fora da soma e do pace médio.
- **Atividades:** feed de corridas no estilo Strava, com o teste de Cooper separado e o nome da corrida editável. Tem um gráfico de km por semana com marcador arrastável.
- **Conversor:** preencha dois entre distância, tempo e pace, e o terceiro é calculado. Também converte pace em km/h.
- **Menu:** embaixo no celular. No computador (a partir de 1000 px) vira uma barra lateral, com o plano em colunas.

## Visual

- Minimalista, fundo branco e texto quase preto.
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
