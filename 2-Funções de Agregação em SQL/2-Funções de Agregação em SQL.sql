

-- Dica: SEMPRE VERIFIQUE OS DADOS!
SELECT * FROM produtos;


-- Qual é o valor total de produtos em estoque por categoria?

SELECT categoria, SUM(preco * quantidade) AS valor_total
FROM produtos
GROUP BY categoria;


-- Qual é a quantidade média de produtos em estoque por categoria?

SELECT categoria, ROUND(AVG(quantidade), 0) AS quantidade_media_produtos
FROM produtos
GROUP BY categoria
ORDER BY categoria;


-- Qual é o número total de categorias de produtos?

SELECT COUNT(DISTINCT categoria) AS total_categorias
FROM produtos;


-- Qual é a categoria com a maior quantidade de produtos em estoque?

SELECT categoria, SUM(quantidade) AS quantidade_total
FROM produtos
GROUP BY categoria
ORDER BY quantidade_total DESC
LIMIT 1;


















