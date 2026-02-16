SELECT idCliente, 
        COUNT(IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2024-01-01' 
AND DtCriacao < '2025-01-01' 

-- WHERE substr(DtCriacao, 1, 4) = '2024'

GROUP BY idCliente

ORDER BY COUNT(IdTransacao) DESC