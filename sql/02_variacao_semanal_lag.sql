-- Query 2: variação semanal do preço médio, com LAG.
-- LAG pega o preço da semana anterior do mesmo município e produto.
-- variacao_pct é a variação em relação à semana anterior. Nula na primeira semana.
WITH semanal AS (
    SELECT
        municipio,
        produto,
        ano_iso,
        semana,
        MIN(data)            AS inicio_semana,
        ROUND(AVG(preco), 3) AS preco_medio
    FROM precos_rj
    GROUP BY municipio, produto, ano_iso, semana
),
com_anterior AS (
    SELECT
        municipio,
        produto,
        inicio_semana,
        preco_medio,
        LAG(preco_medio) OVER (
            PARTITION BY municipio, produto
            ORDER BY inicio_semana
        ) AS preco_semana_anterior
    FROM semanal
)
SELECT
    municipio,
    produto,
    inicio_semana,
    preco_medio,
    preco_semana_anterior,
    ROUND(100.0 * (preco_medio - preco_semana_anterior) / preco_semana_anterior, 2) AS variacao_pct
FROM com_anterior
ORDER BY municipio, produto, inicio_semana;
