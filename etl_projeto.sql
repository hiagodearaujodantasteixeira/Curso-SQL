CREATE TABLE tb_freature_store AS 

WITH tb_transacao AS (
    SELECT IdTransacao,
            idCliente,
            qtdePontos,
            datetime(substr(DtCriacao, 1, 19)) AS dtCriacao,
            julianday('2025-08-01') - 
                    julianday(substr(DtCriacao, 1, 10)) AS diffdate,
            CAST(substr(DtCriacao, 12, 2) AS INT) AS dtHora
    
    FROM transacoes

    WHERE DtCriacao < '2025-08-01'
),

tb_idade AS (
    SELECT idCliente,
            datetime(substr(DtCriacao, 1, 19)) AS dtCriacao,
            julianday('now') - julianday(substr(DtCriacao, 1, 19)) AS idadeBase

    FROM clientes
),

tb_sumario_transacoes AS (
    SELECT idCliente,
        count(IdTransacao) AS qtTransacaoVida,
        count(CASE
                WHEN diffdate <= 56 THEN IdTransacao END) AS qtTransacao56,
        count(CASE
                WHEN diffdate <= 28 THEN IdTransacao END) AS qtTransao28,
        count(CASE
                WHEN diffdate <= 14 THEN IdTransacao END) AS qtTransacao14,
        count(CASE
                WHEN diffdate <= 7 THEN IdTransacao END) AS qtTransacao7,
        
        min(diffdate) AS ultimaInteracao,

        sum(qtdePontos) AS saldoPontos,

        sum(CASE
            WHEN qtdePontos > 0 THEN qtdePontos ELSE 0 END) AS qtdePontosPositivosVida,
        sum(CASE 
            WHEN qtdePontos > 0 AND diffdate <= 56 THEN qtdePontos ELSE 0 END) AS qtdePontosPositivos56,
        sum(CASE 
            WHEN qtdePontos > 0 AND diffdate <= 28 THEN qtdePontos ELSE 0 END) AS qtdePontosPositivos28,
        sum(CASE 
            WHEN qtdePontos > 0 AND diffdate <= 14 THEN qtdePontos ELSE 0 END) AS qtdePontosPositivos14,
       sum(CASE 
        WHEN qtdePontos > 0 AND diffdate <= 7 THEN qtdePontos ELSE 0 END) AS qtdePontosPositivos7,

        sum(CASE
            WHEN qtdePontos < 0 THEN qtdePontos ELSE 0 END) AS qtdePontosNegativosVida,
        sum(CASE 
            WHEN qtdePontos < 0 AND diffdate <= 56 THEN qtdePontos ELSE 0 END) AS qtdePontosNegativos56,
        sum(CASE 
            WHEN qtdePontos < 0 AND diffdate <= 28 THEN qtdePontos ELSE 0 END) AS qtdePontosNegativos28,
        sum(CASE 
            WHEN qtdePontos < 0 AND diffdate <= 14 THEN qtdePontos ELSE 0 END) AS qtdePontosNegativos14,
       sum(CASE 
        WHEN qtdePontos < 0 AND diffdate <= 7 THEN qtdePontos ELSE 0 END) AS qtdePontosNegativos7

    FROM tb_transacao

    GROUP BY idCliente
),

tb_transacao_produtos AS (
    SELECT t1.*,
        t3.DescNomeProduto,
        t3.DescCategoriaProduto

    FROM tb_transacao AS t1

    LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

    LEFT JOIN produtos AS t3
    ON CAST(t2.IdProduto AS INT) = CAST(t3.IdProduto AS INT) 
),

tb_cliente_produto AS (
    SELECT idCliente,
            DescNomeProduto,
            count(*) AS qtProdutoVida,
            count(CASE
                    WHEN diffdate <= 56 THEN IdTransacao END) AS qtProduto56,
            count(CASE
                    WHEN diffdate <= 28 THEN IdTransacao END) AS qtProduto28,
            count(CASE
                    WHEN diffdate <= 14 THEN IdTransacao END) AS qtProduto14,
            count(CASE
                    WHEN diffdate <= 7 THEN IdTransacao END) AS qtProduto7     

    FROM tb_transacao_produtos

    GROUP BY idCliente, DescNomeProduto
),

tb_cliente_qtproduto AS (
    SELECT *,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtProdutoVida DESC) AS rnVida,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtProduto56 DESC) AS rn56,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtProduto28 DESC) AS rn28,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtProduto14 DESC) AS rn14,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtProduto7 DESC) AS rn7

    FROM tb_cliente_produto
),

tb_cliente_dia AS (
    SELECT idCliente,
            strftime('%w', DtCriacao) AS dtDia,
            count(*) AS qtTransacao28

    FROM tb_transacao

    WHERE diffdate <= 28

    GROUP BY idCliente, dtDia
),

tb_cliente_dia_rn AS (
    SELECT *,
            row_number() OVER (PARTITION BY idCliente ORDER BY qtTransacao28 DESC) AS rnDia

    FROM tb_cliente_dia
),

tb_cliente_periodo AS (
    SELECT idCliente,
            CASE
                WHEN dtHora BETWEEN 7 AND 12 THEN 'manhã'
                WHEN dtHora BETWEEN 13 AND 18 THEN 'tarde'
                WHEN dtHora BETWEEN 18 AND 23 THEN 'noite'
                ELSE 'madrugada'
                END AS periodo,
            count(*) AS contTransacao

    FROM tb_transacao

    WHERE diffdate <= 28

    GROUP BY 1, 2
),

tb_cliente_periodo_rn AS (
    SELECT *,
            row_number() OVER (PARTITION BY idCliente ORDER BY contTransacao DESC) AS rnPeriodo

    FROM tb_cliente_periodo
),

tb_join AS (
    SELECT t1.*,
            t3.DescNomeProduto AS produtoVida,
            t4.DescNomeProduto AS produto56,
            t5.DescNomeProduto AS produto28,
            t6.DescNomeProduto AS produto14,
            t7.DescNomeProduto AS produto7,
            COALESCE(t8.dtDia, -1) AS dtDia,
            COALESCE(t9.periodo, 'sem informação') AS periodoMais

    FROM tb_sumario_transacoes AS t1

    LEFT JOIN tb_idade AS t2
    ON t1.idCliente = t2.idCliente

    LEFT JOIN tb_cliente_qtproduto AS t3
    ON t1.idCliente = t3.idCliente
    AND t3.rnVida = 1

    LEFT JOIN tb_cliente_qtproduto AS t4
    ON t1.idCliente = t4.idCliente
    AND t3.rn56 = 1

    LEFT JOIN tb_cliente_qtproduto AS t5
    ON t1.idCliente = t5.idCliente
    AND t3.rn28 = 1

    LEFT JOIN tb_cliente_qtproduto AS t6
    ON t1.idCliente = t6.idCliente
    AND t3.rn14 = 1

    LEFT JOIN tb_cliente_qtproduto AS t7
    ON t1.idCliente = t7.idCliente
    AND t3.rn7 = 1

    LEFT JOIN tb_cliente_dia_rn AS t8
    ON t1.idCliente = t8.idCliente
    AND t8.rnDia = 1

    LEFT JOIN tb_cliente_periodo_rn AS t9
    ON t1.idCliente = t9.idCliente
    AND t9.rnPeriodo = 1
)

SELECT '2025-08-01' AS dtReff,
        *,
        1. * qtTransao28 / qtTransacaoVida AS engajamentoD28

FROM tb_join