SELECT IdTransacao,
        QtdePontos,
        CASE
            WHEN QtdePontos < 10 THEN 'Baixo'
            WHEN QtdePontos < 500 THEN 'Médio'
            ELSE 'Alto'
        END AS ParâmetroPontos

FROM transacoes

ORDER BY QtdePontos DESC


