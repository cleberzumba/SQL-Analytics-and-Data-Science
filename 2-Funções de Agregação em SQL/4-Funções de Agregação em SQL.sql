


-- Em quais dias o valor total de vendas foi superior a $50?

SELECT data_venda, SUM(valor) AS total_vendas
FROM vendas
GROUP BY data_venda
HAVING SUM(valor) > 50;


-- Quais produtos tiveram um valor total de vendas superior a $50?

SELECT id_produto, SUM(valor) AS total_vendas
FROM vendas
GROUP BY id_produto
HAVING SUM(valor) > 50;



















