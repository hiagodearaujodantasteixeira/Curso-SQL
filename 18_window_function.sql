WITH tb_sumario_dias AS(
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
            COUNT(DISTINCT IdTransacao) AS qtTransacao
            
    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'


    GROUP BY substr(DtCriacao, 1, 10)
)

SELECT *,
        sum(qtTransacao) OVER (ORDER BY dtDia) AS qtTransacaoAcumulada

FROM tb_sumario_dias