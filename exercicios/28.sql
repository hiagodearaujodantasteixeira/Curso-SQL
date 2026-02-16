SELECT t1.idCliente,
        julianday('now') - julianday(substr(t1.DtCriacao, 1, 10)) AS idadeBase,
        COUNT(t2.IdTransacao) AS QtdTransacoes

FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t1.idCliente, julianday('now') - julianday(substr(t1.DtCriacao, 1, 10))


ORDER BY COUNT(t2.IdTransacao) DESC
