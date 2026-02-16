SELECT idCliente, 
        qtdePontos, 
        QtdePontos + 10 AS qtdePontosplus10,
        QtdePontos * 2 AS qtdePontosmulti2,
        -- substr(DtCriacao, 1, 19) se estivesse mal formatado
        datetime(DtCriacao) AS dtCriacaoNova,
        strftime('%w', DtCriacao) AS diaDaSemana
FROM clientes