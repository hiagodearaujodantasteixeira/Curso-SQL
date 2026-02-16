SELECT IdProduto,
        DescNomeProduto,
        DescCategoriaProduto
FROM produtos
WHERE DescCategoriaProduto LIKE'%chapeu%'