-- SELECT IdProduto,
--         count(*)

-- FROM transacao_produto

-- GROUP BY IdProduto

-- cliente que mais juntou pontos em julho

SELECT IdCliente,
        sum(qtdePontos),
        count(IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

GROUP BY idCliente

ORDER BY sum(qtdePontos) DESC

LIMIT 10