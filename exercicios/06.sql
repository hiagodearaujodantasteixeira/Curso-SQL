SELECT IdTransacao,
        DtCriacao,
        strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaDaSemana
FROM transacoes
WHERE strftime('%w', datetime(substr(DtCriacao, 1, 19))) IN ('0', '6')