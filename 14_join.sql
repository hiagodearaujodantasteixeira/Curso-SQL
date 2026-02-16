SELECT *

FROM transacao_produto

LEFT JOIN produtos
ON transacao_produto.IdProduto = produtos.IdProduto

LIMIT 10;

SELECT *

FROM transacao_produto AS t1

INNER JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

LIMIT 10;

SELECT t1.*, 
        t2.DescCategoriaProduto

FROM transacao_produto AS t1

INNER JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

LIMIT 10;