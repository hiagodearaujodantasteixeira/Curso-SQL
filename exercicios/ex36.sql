WITH tb_clientes_cadastrados AS (
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT idCliente) AS qtClientes

    FROM clientes

    GROUP BY substr(DtCriacao, 1, 10)
)

SELECT *,
        sum(qtClientes) OVER (ORDER BY dtDia) AS qtClienteDia

FROM tb_clientes_cadastrados