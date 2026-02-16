SELECT COUNT(DISTINCT t1.idCliente) AS QtDePessoas

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescNomeProduto = 'Lista de presença' 
AND t1.DtCriacao >= '2025-08-25'
AND t1.DtCriacao < '2025-08-29'


