


-- Qual o Número Total de Vendas?
SELECT COUNT(*) FROM ods.vendas;


-- Qual a Média de Quantidade Vendida
SELECT ROUND(AVG(Quantidade),2) FROM ods.vendas;



-- Qual o Número Total de Produtos Únicos Vendidos?
SELECT COUNT(DISTINCT Id_Produto) FROM ods.vendas;


-- Quantas Vendas Ocorreram Por Produto? Mostre o Resultado em Ordem Decrescente.
SELECT p.nome, COUNT(v.Id_Produto) AS total_num_vendas
FROM ods.vendas v
JOIN ods.produtos p ON v.Id_Produto = p.Id_Produto
GROUP BY p.nome
ORDER BY total_num_vendas DESC;


-- Quais os 5 Produtos com Maior Número de Vendas?
SELECT p.nome, COUNT(*) AS total_vendas
FROM ods.vendas v
JOIN ods.produtos p ON v.Id_Produto = p.Id_Produto
GROUP BY p.nome
ORDER BY total_vendas DESC
LIMIT 5;


-- Quais Clientes Fizeram 6 ou Mais Transações de Compra?
SELECT c.nome, COUNT(v.Id_Cliente) AS total_compras
FROM ods.vendas v
JOIN ods.clientes c ON v.Id_Cliente = c.Id_Cliente
GROUP BY c.nome
HAVING COUNT(v.Id_Cliente) >= 6
ORDER BY total_compras DESC;


-- Qual o Total de Transações Comerciais Por Mês no Ano de 2024? 
-- Apresente os Nomes dos Meses no Resultado, Que Deve Ser Ordenado Por Mês.
SELECT
    CASE
        WHEN EXTRACT(MONTH FROM Data_Venda) = 1 THEN 'Janeiro'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 2 THEN 'Fevereiro'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 3 THEN 'Março'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 4 THEN 'Abril'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 5 THEN 'Maio'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 6 THEN 'Junho'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 7 THEN 'Julho'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 8 THEN 'Agosto'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 9 THEN 'Setembro'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 10 THEN 'Outubro'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 11 THEN 'Novembro'
        WHEN EXTRACT(MONTH FROM Data_Venda) = 12 THEN 'Dezembro'
    END AS mes,
    COUNT(*) AS total_vendas
FROM ods.vendas
WHERE EXTRACT(YEAR FROM Data_Venda) = 2024
GROUP BY EXTRACT(MONTH FROM Data_Venda)
ORDER BY EXTRACT(MONTH FROM Data_Venda);


-- Quantas Vendas de Notebooks Ocorreram em Junho e Julho de 2023?
SELECT COUNT(*) AS total_vendas_notebook
FROM ods.vendas v
JOIN ods.produtos p ON v.Id_Produto = p.Id_Produto
WHERE p.nome = 'Notebook'
  AND EXTRACT(YEAR FROM v.Data_Venda) = 2023
  AND EXTRACT(MONTH FROM v.Data_Venda) IN (6, 7);


-- Qual o Total de Vendas Por Mês e Por Ano ao Longo do Tempo?
SELECT DATE_TRUNC('month', Data_Venda) AS mes, COUNT(*) AS total_vendas
FROM ods.vendas
GROUP BY mes
ORDER BY mes;

select EXTRACT(YEAR FROM v.data_venda) as ano,
       CASE
        WHEN EXTRACT(MONTH FROM v.data_venda) = 1 THEN 'Janeiro'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 2 THEN 'Fevereiro'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 3 THEN 'Março'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 4 THEN 'Abril'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 5 THEN 'Maio'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 6 THEN 'Junho'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 7 THEN 'Julho'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 8 THEN 'Agosto'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 9 THEN 'Setembro'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 10 THEN 'Outubro'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 11 THEN 'Novembro'
        WHEN EXTRACT(MONTH FROM v.data_venda) = 12 THEN 'Dezembro'
    END AS mes, 
       count(*) as total
from ods.vendas v
group by EXTRACT(YEAR FROM v.data_venda), EXTRACT(MONTH FROM v.data_venda)
ORDER BY EXTRACT(YEAR FROM v.data_venda), EXTRACT(MONTH FROM v.data_venda)



-- Quais Produtos Tiveram Menos de 100 Transações de Venda?
SELECT p.nome, COUNT(v.Id_Produto) AS total_vendas
FROM ods.vendas v
JOIN ods.produtos p ON v.Id_Produto = p.Id_Produto
GROUP BY p.nome
HAVING COUNT(v.Id_Produto) < 100
ORDER BY total_vendas;


-- Quais Clientes Compraram Smartphone e Também Compraram Smartwatch?

-- Subconsulta para clientes que compraram Smartphone
WITH compradores_smartphone AS (
    SELECT v.Id_Cliente
    FROM ods.vendas v
    JOIN ods.produtos p ON v.Id_Produto = p.Id_Produto
    WHERE p.nome = 'Smartphone'
    GROUP BY v.Id_Cliente
),
-- Subconsulta para clientes que compraram Smartwatch
compradores_smartwatch AS (
    SELECT v.Id_Cliente
    FROM ods.vendas v
    JOIN ods.produtos p ON v.Id_Produto = p.Id_Produto
    WHERE p.nome = 'Smartwatch'
    GROUP BY v.Id_Cliente
)
-- Seleciona clientes que estão em ambas as subconsultas
SELECT c.nome
FROM ods.clientes c
WHERE c.Id_Cliente IN (
    SELECT Id_Cliente FROM compradores_smartphone
    INTERSECT
    SELECT Id_Cliente FROM compradores_smartwatch
)
ORDER BY c.nome;


-- Quais Clientes Compraram Smartphone e Também Compraram Smartwatch, Mas Não Compraram Notebook?

-- Clientes que compraram Smartphone
WITH clientes_smartphone AS (
    SELECT Id_Cliente
    FROM ods.vendas
    JOIN ods.produtos ON vendas.Id_Produto = produtos.Id_Produto
    WHERE produtos.nome = 'Smartphone'
),
-- Clientes que compraram Smartwatch
clientes_smartwatch AS (
    SELECT Id_Cliente
    FROM ods.vendas
    JOIN ods.produtos ON vendas.Id_Produto = produtos.Id_Produto
    WHERE produtos.nome = 'Smartwatch'
),
-- Clientes que compraram Notebook
clientes_notebook AS (
    SELECT Id_Cliente
    FROM ods.vendas
    JOIN ods.produtos ON vendas.Id_Produto = produtos.Id_Produto
    WHERE produtos.nome = 'Notebook'
)
-- Clientes que compraram Smartphone e Smartwatch, mas não compraram Notebook
SELECT clientes.nome
FROM ods.clientes
WHERE Id_Cliente IN (
    SELECT Id_Cliente FROM clientes_smartphone
    INTERSECT
    SELECT Id_Cliente FROM clientes_smartwatch
)
AND Id_Cliente NOT IN (
    SELECT Id_Cliente FROM clientes_notebook
);


-- Quais Clientes Compraram Smartphone e Também Compraram Smartwatch, Mas Não Compraram Notebook em Maio/2024?

-- Clientes que compraram Smartphone em Maio/2024
WITH clientes_smartphone AS (
    SELECT Id_Cliente
    FROM ods.vendas
    JOIN ods.produtos ON vendas.Id_Produto = produtos.Id_Produto
    WHERE produtos.nome = 'Smartphone'
      AND DATE_PART('year', vendas.Data_Venda) = 2024
      AND DATE_PART('month', vendas.Data_Venda) = 5
),
-- Clientes que compraram Smartwatch em Maio/2024
clientes_smartwatch AS (
    SELECT Id_Cliente
    FROM ods.vendas
    JOIN ods.produtos ON vendas.Id_Produto = produtos.Id_Produto
    WHERE produtos.nome = 'Smartwatch'
      AND DATE_PART('year', vendas.Data_Venda) = 2024
      AND DATE_PART('month', vendas.Data_Venda) = 5
),
-- Clientes que compraram Notebook em Maio/2024
clientes_notebook AS (
    SELECT Id_Cliente
    FROM ods.vendas
    JOIN ods.produtos ON vendas.Id_Produto = produtos.Id_Produto
    WHERE produtos.nome = 'Notebook'
      AND DATE_PART('year', vendas.Data_Venda) = 2024
      AND DATE_PART('month', vendas.Data_Venda) = 5
)
-- Clientes que compraram Smartphone e Smartwatch, mas não Notebook em Maio/2024
SELECT ods.clientes.nome
FROM ods.clientes
WHERE Id_Cliente IN (
    SELECT Id_Cliente FROM clientes_smartphone
    INTERSECT
    SELECT Id_Cliente FROM clientes_smartwatch
)
AND Id_Cliente NOT IN (
    SELECT Id_Cliente FROM clientes_notebook
);


-- Qual a Média Móvel de Quantidade de Unidades Vendidas ao Longo do Tempo? 
-- Considere Janela de 7 Dias.
SELECT
    Data_Venda,
    Quantidade,
    ROUND(AVG(Quantidade) OVER (ORDER BY Data_Venda
                          ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING), 2) AS media_movel_7dias
FROM ods.vendas
ORDER BY Data_Venda;


-- Qual a Média Móvel e Desvio Padrão Móvel de Quantidade de Unidades Vendidas ao Longo do Tempo? 
-- Considere Janela de 7 Dias.
SELECT
    Data_Venda,
    Quantidade,
    ROUND(AVG(Quantidade) OVER (ORDER BY Data_Venda
                                ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING), 2) AS media_movel_7dias,
    ROUND(STDDEV(Quantidade) OVER (ORDER BY Data_Venda
                                   ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING), 2) AS desvio_padrao_7dias
FROM ods.vendas
ORDER BY Data_Venda;


-- Quais Clientes Estão Cadastrados, Mas Ainda Não Fizeram Transação?
SELECT c.Id_Cliente, c.nome
FROM ods.clientes c
LEFT JOIN ods.vendas v ON c.Id_Cliente = v.Id_Cliente
WHERE v.Id_Cliente IS NULL;


