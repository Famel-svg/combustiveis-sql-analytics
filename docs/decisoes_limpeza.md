# Decisões de limpeza

Gerado por notebooks/01_limpeza.ipynb.

| Etapa | Entrada | Saída | Descartadas | Motivo |
|---|---:|---:|---:|---|
| UF = RJ | 2,608,591 | 214,065 | 2,394,526 | Recorte definido no PROMPT.md |
| Produto em {gasolina, etanol, diesel} | 214,065 | 147,189 | 66,876 | Aditivada tem preço próprio; GNV é em R$/m³ |
| Valor sem vírgula decimal | 147,189 | 147,144 | 45 | Valor como '5' é ambíguo (R$ 5,00 ou truncado); descartado |
| Data inválida | 147,144 | 147,144 | 0 | Data não parseável em dd/mm/aaaa |
| Duplicata exata | 147,144 | 147,142 | 2 | Mesma revenda, produto, data e preço em linhas repetidas |
| Outlier de domínio | 147,142 | 147,142 | 0 | Preço fora de R$ 2,00 a R$ 12,00 por litro |
