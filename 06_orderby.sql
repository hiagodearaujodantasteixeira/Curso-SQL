-- SELECT *
-- FROM clientes
-- ORDER BY Qtdepontos DESC

SELECT *
FROM clientes
WHERE flTwitch = 1
ORDER BY DtCriacao, qtdePontos DESC