SELECT t1.DescNomeProduto AS Nome,
        COUNT(t3.IdTransacao) AS Qtd,
        substr(t3.DtCriacao, 1, 7) AS Mes

FROM produtos AS t1

INNER JOIN transacao_produto AS t2
ON t1.IdProduto = t2.IdProduto

INNER JOIN transacoes AS t3
ON t2.IdTransacao = t3.IdTransacao

WHERE t1.DescNomeProduto = 'Lista de presença'
AND substr(t3.DtCriacao, 1, 4) = '2024'

GROUP BY substr(t3.DtCriacao, 6, 2)

ORDER BY COUNT(t1.IdProduto) DESC

