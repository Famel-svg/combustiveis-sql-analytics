-- Tabela de preços por coleta, recriada a cada carga (scripts/carga_postgres.py).
-- Uma linha = uma coleta de um produto em um posto do RJ.
DROP TABLE IF EXISTS precos_rj;

CREATE TABLE precos_rj (
    municipio     TEXT          NOT NULL,
    produto       TEXT          NOT NULL,
    data          DATE          NOT NULL,
    semana        INTEGER       NOT NULL,  -- semana ISO da coleta
    ano_iso       INTEGER       NOT NULL,  -- ano ISO da coleta (pode diferir do ano civil na virada)
    preco         NUMERIC(6,2)  NOT NULL,  -- R$ por litro
    revenda       TEXT,
    cnpj_revenda  TEXT,
    bandeira      TEXT,
    unidade       TEXT
);

CREATE INDEX idx_precos_rj_mun_prod_data ON precos_rj (municipio, produto, data);
