SELECT SUM(qtdePontos) AS TotalPontos,
        COUNT(DISTINCT substr(DtCriacao, 1, 10)) AS qtDeDiasUnicos,
        SUM(qtdePontos) / COUNT(DISTINCT substr(DtCriacao, 1, 10)) AS MediaDiaria
        
FROM transacoes

WHERE qtdePontos > 0