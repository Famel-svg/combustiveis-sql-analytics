-- Query 5: em quais município-semanas o etanol compensa pela regra de 70%.
-- Compara o preço médio semanal do etanol com o da gasolina no mesmo município e semana.
-- Compensa quando etanol <= 70% da gasolina. Só entram semanas com os dois produtos.
-- Achado descritivo: não prova causa. Ver README, seção Limites.
WITH semanal AS (
    SELECT
        municipio,
        produto,
        ano_iso,
        semana,
        MIN(data)            AS inicio_semana,
        ROUND(AVG(preco), 3) AS preco_medio
    FROM precos_rj
    WHERE produto IN ('ETANOL', 'GASOLINA')
    GROUP BY municipio, produto, ano_iso, semana
),
par AS (
    SELECT
        municipio,
        ano_iso,
        semana,
        MIN(inicio_semana) AS inicio_semana,
        MAX(CASE WHEN produto = 'ETANOL'   THEN preco_medio END) AS etanol,
        MAX(CASE WHEN produto = 'GASOLINA' THEN preco_medio END) AS gasolina
    FROM semanal
    GROUP BY municipio, ano_iso, semana
    HAVING COUNT(DISTINCT produto) = 2
)
SELECT
    municipio,
    inicio_semana,
    etanol,
    gasolina,
    ROUND(100.0 * etanol / gasolina, 1) AS relacao_pct,
    (etanol <= 0.70 * gasolina)         AS etanol_compensa
FROM par
ORDER BY etanol_compensa DESC, relacao_pct ASC, municipio, inicio_semana;
