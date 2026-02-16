WITH tb_cliente_dia AS (    
    SELECT idCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            sum(qtdePontos) AS totalPontos

    FROM transacoes

    GROUP BY idCliente, dtDia
)

SELECT *,
        sum(totalPontos) OVER (PARTITION BY idCliente ORDER BY dtDia) AS totalAcumulado

FROM tb_cliente_dia