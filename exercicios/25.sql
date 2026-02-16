SELECT t1.idCliente,
        SUM(t1.QtdePontos),
        t2.IdProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

WHERE t2.IdProduto = 1 
OR t2.IdProduto = 13

GROUP BY t1.idCliente

ORDER BY SUM(t1.QtdePontos)

LIMIT 5

