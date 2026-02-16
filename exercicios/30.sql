-- Qual o dia da semana mais ativo de cada usuário?
SELECT idCliente,
        strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaDaSemana

FROM transacoes

