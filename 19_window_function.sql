WITH tb_sumario_cliente AS (    
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
            idCliente,
            count( DISTINCT IdTransacao) AS qtTransacao

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY idCliente, dtDia
),

tb_lag AS (  
    SELECT *,
            sum(qtTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS qtTransacaoAcumulada,
            lag(qtTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagTransacao

    FROM tb_sumario_cliente
)

SELECT *,
        1.* qtTransacao / lagTransacao 

FROM tb_lag
