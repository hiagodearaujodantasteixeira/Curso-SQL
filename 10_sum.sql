-- durante esse mes tivemos essa qt total

-- SELECT sum(qtdePontos)
-- FROM transacoes
-- WHERE DtCriacao >= '2025-07-01'
-- AND DtCriacao < '2025-08-01'

-- durante esse mes tivemos esses saldos

SELECT sum(qtdePontos),
        sum(CASE 
            WHEN qtdePontos > 0 THEN qtdePontos
        END) AS qtdePontosPositivos,
        sum(CASE
            WHEN qtdePontos < 0 THEN qtdePontos
        END) AS qtdePontosNegativos

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01' 


