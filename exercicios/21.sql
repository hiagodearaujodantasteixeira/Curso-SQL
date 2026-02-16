SELECT IdProduto,
        SUM(vlProduto)

FROM transacao_produto

GROUP BY IdProduto

ORDER BY SUM(vlProduto) DESC

LIMIT 10