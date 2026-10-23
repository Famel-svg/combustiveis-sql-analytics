"""Carrega data/processed/precos_rj.csv na tabela precos_rj do PostgreSQL.

Reproduzível: recria a tabela a cada execução. Pré-requisito: notebooks/01_limpeza.ipynb
já gerou o CSV, e o banco do docker-compose.yml está no ar.

URL de conexão: variável DATABASE_URL. Padrão = banco local do docker-compose.yml.
"""

import os
from pathlib import Path

import psycopg

RAIZ = Path(__file__).resolve().parent.parent
CSV = RAIZ / "data" / "processed" / "precos_rj.csv"
DDL = RAIZ / "sql" / "00_schema.sql"
URL = os.environ.get("DATABASE_URL", "postgresql://combustiveis:combustiveis@localhost:5432/combustiveis")


def main() -> None:
    if not CSV.exists():
        raise SystemExit(f"Falta {CSV}. Rode notebooks/01_limpeza.ipynb antes.")

    with psycopg.connect(URL) as conn, conn.cursor() as cur:
        cur.execute(DDL.read_text(encoding="utf-8"))
        with CSV.open("rb") as f, cur.copy(
            "COPY precos_rj (municipio, produto, data, semana, ano_iso, preco, "
            "revenda, cnpj_revenda, bandeira, unidade) FROM STDIN WITH (FORMAT csv, HEADER true)"
        ) as copia:
            while bloco := f.read(1 << 16):
                copia.write(bloco)
        cur.execute("SELECT count(*) FROM precos_rj")
        (total,) = cur.fetchone()
    print(f"precos_rj: {total:,} linhas carregadas")


if __name__ == "__main__":
    main()
