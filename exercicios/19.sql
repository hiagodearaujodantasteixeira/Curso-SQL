SELECT COUNT(IdTransacao) AS QtDeTransacao,  
        strftime('%w', DtCriacao) AS diaDaSemana

FROM transacoes

WHERE substr(DtCriacao, 1, 4) = '2025'

GROUP BY strftime('%w', DtCriacao)

ORDER BY COUNT(IdTransacao) DESC