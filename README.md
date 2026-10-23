# combustiveis-sql-analytics

Análise de preços de gasolina, etanol e diesel no estado do Rio de Janeiro, em Python e SQL.

![Fluxo do projeto](docs/img/pipeline.svg)

## Motivo do projeto

Este é um projeto de portfólio. O objetivo é mostrar SQL aplicado a dados reais, habilidade pedida em vagas de dados. A pergunta vem de uma dúvida prática: quando abastecer com etanol compensa no bolso.

A regra usada como critério é a dos 70%: o etanol compensa quando o preço por litro é até 70% do preço da gasolina.

![Regra dos 70%](docs/img/regra-70.svg)

O diagrama acima usa valores fictícios para mostrar a regra. Não são dados da ANP.

## Pergunta principal

Como o preço de gasolina, etanol e diesel varia por município e por semana, e em quais municípios o etanol compensa pela regra de 70% do preço da gasolina?

## Hipótese

Municípios do interior do Rio de Janeiro ficam abaixo do limite de 70% com menos frequência que municípios da Região Metropolitana. A hipótese assume que o preço do etanol segue o custo de transporte e a concorrência local.

**O que a refutaria:** se a fração de semanas com etanol até 70% da gasolina for igual ou maior no interior do que na Região Metropolitana, em uma comparação com dados do mesmo período, a hipótese é rejeitada.

## Fontes

Fonte: levantamento semanal de preços da ANP. URLs verificadas e status da licença em [docs/fontes.md](docs/fontes.md).

**Status da licença: não confirmada.** O `PROMPT.md` exige confirmar a licença antes de qualquer análise. Enquanto isso não for feito, nenhum dado é baixado ou analisado.

## Status

| Etapa | Estado |
|---|---|
| Especificação e fontes | feito |
| Confirmação da licença ANP | pendente |
| Limpeza com pandas (notebook) | não iniciada |
| Carga em PostgreSQL | não iniciada |
| Queries SQL (`sql/`) | não iniciada |
| Achados e recomendações | não iniciada |

## Limites

- Recorte: estado do Rio de Janeiro. Mudar o recorte depende de confirmação do dono do projeto.
- A pesquisa da ANP é uma amostra de postos. Ela não cobre todos os postos de cada município.
- Os achados serão descritivos. Eles não provam causa para diferença de preço.

## O que faria diferente

Esta seção será preenchida ao fim da análise.
