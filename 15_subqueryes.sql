SELECT *

FROM transacao_produto AS t1

WHERE t1.IdProduto IN(

    SELECT IdProduto

    FROM produtos

    WHERE DescNomeProduto = 'Resgatar Ponei' 
    );

SELECT COUNT(DISTINCT t1.idCliente)

FROM transacoes AS t1

WHERE t1.idCliente IN (
    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
)
AND substr(t1.DtCriacao, 1, 10) = '2025-08-29' ;

SELECT *

FROM (
    SELECT *

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01'
)

WHERE DtCriacao < '2025-07-01'