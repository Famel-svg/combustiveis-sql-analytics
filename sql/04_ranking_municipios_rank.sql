-- Query 4: ranking de municípios por preço médio do período, com RANK.
-- RANK dá a mesma posição para empates e pula o número seguinte (1, 1, 3).
-- Ranking 1 = município mais barato para aquele produto.
WITH media_periodo AS (
    SELECT
        municipio,
        produto,
        ROUND(AVG(preco), 3) AS preco_medio,
        COUNT(DISTINCT ano_iso * 100 + semana) AS n_semanas  -- chave única da semana ISO
    FROM precos_rj
    GROUP BY municipio, produto
)
SELECT
    produto,
    municipio,
    preco_medio,
    n_semanas,
    RANK() OVER (
        PARTITION BY produto
        ORDER BY preco_medio ASC
    ) AS posicao_mais_barato
FROM media_periodo
ORDER BY produto, posicao_mais_barato, municipio;
