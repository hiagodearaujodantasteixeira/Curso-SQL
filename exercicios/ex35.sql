WITH tb_transacao_dias AS (    
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT IdTransacao) AS qtTransacaoDia

    FROM transacoes

    GROUP BY dtDia
)

SELECT *,
        sum(qtTransacaoDia) OVER (ORDER BY dtDia) AS qtTransacaoAcumulada

FROM tb_transacao_dias