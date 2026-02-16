SELECT COUNT(t1.IdTransacao) AS QtdLovers2024

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

INNER JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE substr(DtCriacao, 1, 4) = '2024'
AND t3.DescCategoriaProduto = 'lovers'
