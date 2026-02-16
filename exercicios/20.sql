SELECT IdProduto,
        COUNT(*)

FROM transacao_produto

GROUP BY IdProduto

ORDER BY count(*) DESC

LIMIT 1