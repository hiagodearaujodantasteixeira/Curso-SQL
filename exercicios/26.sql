SELECT t2.idCliente

FROM transacao_produto AS t1

LEFT JOIN transacoes AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t1.IdProduto = t3.IdProduto

WHERE substr(t2.DtCriacao, 1, 10) = '2025-08-25'
AND t3.DescNomeProduto = 'Lista de presença'
