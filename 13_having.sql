SELECT IdCliente,
        sum(qtdePontos),
        count(IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

GROUP BY idCliente
HAVING sum(qtdePontos) >= 4000

ORDER BY sum(qtdePontos) DESC

LIMIT 10