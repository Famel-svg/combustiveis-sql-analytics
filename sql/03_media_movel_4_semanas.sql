-- Query 3: média móvel de 4 semanas com AVG OVER.
-- A janela ROWS BETWEEN 3 PRECEDING AND CURRENT ROW pega a semana atual e as 3 anteriores.
-- Suaviza ruído semanal de coleta. Nas primeiras 3 semanas a janela é incompleta;
-- n_semanas_na_janela mostra quantas semanas entraram no cálculo.
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
)
SELECT
    municipio,
    produto,
    inicio_semana,
    preco_medio,
    ROUND(AVG(preco_medio) OVER (
        PARTITION BY municipio, produto
        ORDER BY inicio_semana
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ), 3) AS media_movel_4s,
    COUNT(*) OVER (
        PARTITION BY municipio, produto
        ORDER BY inicio_semana
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ) AS n_semanas_na_janela
FROM semanal
ORDER BY municipio, produto, inicio_semana;
