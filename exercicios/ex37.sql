WITH tb_cliente_dia_semana AS (    
    SELECT DISTINCT idCliente,
            count(IdTransacao) AS qtTransacao,
            strftime('%w', datetime(substr(DtCriacao, 1, 10))) AS dtSemana

    FROM transacoes

    GROUP BY idCliente, dtSemana
),

tb_qtTransacao_cliente AS (
    SELECT *,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtTransacao DESC, dtSemana) AS rn

    FROM tb_cliente_dia_semana
)

SELECT *

FROM tb_qtTransacao_cliente

WHERE rn = 1

ORDER BY qtTransacao DESC
