WITH tb_clientes_janeiro AS (
    SELECT DISTINCT idCliente 

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'
)

SELECT DISTINCT t1.*,
                t2.IdTransacao,
                COUNT(DISTINCT t1.idCliente),
                COUNT(DISTINCT t2.idCliente)

FROM tb_clientes_janeiro AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente
AND t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'


