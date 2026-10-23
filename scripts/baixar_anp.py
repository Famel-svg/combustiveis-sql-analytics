"""Baixa os CSVs mensais de preços da ANP (2023-2025) para data/raw.

Fonte e padrão de URL: docs/fontes.md. Arquivos são nacionais; o recorte RJ
é feito na limpeza, não aqui.
"""

from pathlib import Path

import requests

BASE = "https://www.gov.br/anp/pt-br/centrais-de-conteudo/dados-abertos/arquivos/shpc/dsan"
ANOS = [2023, 2024, 2025]
ARQUIVOS = {
    "gasolina-etanol": "precos-gasolina-etanol-{mes:02d}.csv",
    "diesel-gnv": "precos-diesel-gnv-{mes:02d}.csv",
}
DESTINO = Path(__file__).resolve().parent.parent / "data" / "raw"


def main() -> None:
    DESTINO.mkdir(parents=True, exist_ok=True)
    for ano in ANOS:
        for grupo, padrao in ARQUIVOS.items():
            for mes in range(1, 13):
                nome = f"{grupo}-{ano}-{mes:02d}.csv"
                caminho = DESTINO / nome
                if caminho.exists():
                    continue
                url = f"{BASE}/{ano}/{padrao.format(mes=mes)}"
                resp = requests.get(url, timeout=120)
                if resp.status_code != 200:
                    print(f"falhou {resp.status_code}: {url}")
                    continue
                caminho.write_bytes(resp.content)
                print(f"ok {nome} ({len(resp.content)} bytes)")


if __name__ == "__main__":
    main()
