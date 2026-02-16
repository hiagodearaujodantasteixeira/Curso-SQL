WITH tb_primeiro_dia AS (
    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_dias_curso AS (
    SELECT DISTINCT idCliente, 
            substr(DtCriacao, 1, 10) AS presenteDia

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    ORDER BY idCliente, presenteDia
),

tb_qtdeDias AS (
    SELECT t1.idCliente,
        COUNT(DISTINCT t2.presenteDia) AS qtdeDias

    FROM tb_primeiro_dia AS t1

    LEFT JOIN tb_dias_curso AS t2
    ON t1.idCliente = t2.idCliente

    GROUP BY t1.idCliente
)

SELECT AVG(qtdeDias)

FROM tb_qtdeDias