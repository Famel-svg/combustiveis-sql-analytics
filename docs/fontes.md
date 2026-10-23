# Fontes de dados

Registro da verificação exigida pelo `PROMPT.md` antes de qualquer análise.

## Fonte oficial

- Órgão: ANP (Agência Nacional do Petróleo, Gás Natural e Biocombustíveis).
- Página: https://www.gov.br/anp/pt-br/centrais-de-conteudo/dados-abertos/serie-historica-de-precos-de-combustiveis
- Consulta em: 2026-10-23.

## URLs de CSV (verificadas na página oficial)

Série semanal agrupada por mês, combustíveis automotivos (etanol, gasolina C, diesel):

- Padrão 2023–2025: `https://www.gov.br/anp/pt-br/centrais-de-conteudo/dados-abertos/arquivos/shpc/dsan/AAAA/precos-gasolina-etanol-MM.csv`
- Padrão 2023–2025 (diesel): `.../dsan/AAAA/precos-diesel-gnv-MM.csv`
- Série semestral 2004–2021: `.../arquivos/shpc/dsas/ca/ca-AAAA-0S.csv`

Os nomes de 2026 não seguem padrão único. Cada URL deve ser conferida antes do download.

Os semestres de 2022 a 2026 em `dsas/ca/` são `.zip`, não `.csv`.

## Licença de uso

**Não verificada.** A página oficial lista "Termos de uso do portal da ANP" e "Dados abertos", mas o texto dos termos não foi obtido na consulta. Nenhuma menção a Creative Commons ou outra licença foi encontrada no site oficial.

Um espelho de terceiros (data.amerigeoss.org) indica Creative Commons Attribution. Essa informação não é fonte oficial e não foi usada como base.

Confirmação: o dono do projeto confirmou a licença de uso em 2026-10-23 e autorizou o prosseguimento. O agente não leu o texto dos termos; a confirmação é do dono, não de uma leitura automatizada. Para citar a licença exata no README, o dono deve copiá-la dos "Termos de uso do portal da ANP".

## Status

URLs confirmadas. Licença confirmada pelo dono do projeto em 2026-10-23.
