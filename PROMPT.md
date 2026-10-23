# combustiveis-sql-analytics

Prompt para colar numa sessão nova, no repo deste projeto.

Crie um projeto de análise chamado combustiveis-sql-analytics, em Python e SQL.

Antes de qualquer análise:
- Verifique na página oficial da ANP (levantamento de preços de combustíveis) a URL do CSV e a licença de uso. Registre as duas no README. Se não conseguir verificar, pare e diga.

Recorte: estado do Rio de Janeiro. Confirme com o dono do projeto se mudar.

Pergunta principal, escrita no README antes da análise:
como o preço de gasolina, etanol e diesel varia por município e por semana, e em quais municípios o etanol compensa (regra de 70% do preço da gasolina)?
Escreva também a hipótese e o que a refutaria.

Etapas:
- Notebook pandas com limpeza documentada: nulos, vírgula decimal, grafias de município, outliers. Registre quantas linhas foram descartadas e por quê, em uma tabela de decisões.
- Carga em PostgreSQL por script reproduzível.
- Pasta sql/ com: CTE, janelas (LAG para variação semanal, AVG OVER para média móvel de 4 semanas, RANK por município) e 5 queries comentadas.
- requirements.txt com versões fixadas.

README:
- Achados, cada um com recomendação e limite ("o dado não prova X").
- Seção "o que faria diferente".

Commits pequenos, com mensagens claras.
