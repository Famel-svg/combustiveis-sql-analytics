-- Query 1: preço médio semanal por município e produto (CTE).
-- Base de todas as outras queries. Agrupa as coletas por semana ISO.
-- A semana é identificada por (ano_iso, semana); inicio_semana é a primeira data coletada
-- nela, usada como rótulo legível e para ordenar.
WITH semanal AS (
    SELECT
        municipio,
        produto,
        ano_iso,
        semana,
        MIN(data)            AS inicio_semana,
        ROUND(AVG(preco), 3) AS preco_medio,
        COUNT(*)             AS n_coletas
    FROM precos_rj
    GROUP BY municipio, produto, ano_iso, semana
)
SELECT *
FROM semanal
ORDER BY municipio, produto, inicio_semana;
