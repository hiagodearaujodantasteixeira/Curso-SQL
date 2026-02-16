WITH alunos_dia_01 AS (
    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao, 1, 10) = '2025-08-25' 
),

tb_dia_cliente AS (
    SELECT t1.idCliente,
            substr(t2.DtCriacao, 1, 10) AS dtDia,
            COUNT(*) AS qtdeInteracoes

    FROM alunos_dia_01 AS t1

    LEFT JOIN transacoes AS t2
    ON t1.idCliente = t2.idCliente
    AND t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'

    GROUP BY t1.idCliente, dtDia
),

max_interacao AS (
    SELECT idCliente,
            max(qtdeInteracoes) AS maxInter

    FROM tb_dia_cliente

    GROUP BY idCliente
)

SELECT t1.idCliente,
        max(t2.dtDia) AS maxDt,
        max(maxInter)

FROM max_interacao AS t1

LEFT JOIN tb_dia_cliente AS t2
ON t1.idCliente = t2.idCliente
AND t1.maxInter = t2.qtdeInteracoes

GROUP BY t1.idCliente

ORDER BY t1.idCliente