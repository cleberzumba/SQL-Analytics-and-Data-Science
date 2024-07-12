


-- Verifica os dados
SELECT *
FROM vendas;


-- Qual o total de vendas por produto?

SELECT Produto, 
       SUM(Quantidade * ValorUnitario) AS TotalVendas
FROM vendas
GROUP BY Produto;


-- Qual o total de vendas por vendedor?

SELECT Vendedor, 
       SUM(Quantidade * ValorUnitario) AS TotalVendas
FROM vendas
GROUP BY Vendedor;


-- Qual o total de vendas por dia?

SELECT DataVenda, 
       SUM(Quantidade * ValorUnitario) AS TotalVendas
FROM vendas
GROUP BY DataVenda;


-- Como as vendas se acumulam por dia e por produto (incluindo subtotais diários)?

SELECT 
    COALESCE(TO_CHAR(DataVenda, 'YYYY-MM-DD'), 'Total Geral') AS DataVenda,
    COALESCE(Produto, 'Todos os Produtos') AS Produto,
    SUM(Quantidade * ValorUnitario) AS TotalVendas
FROM vendas
GROUP BY ROLLUP (DataVenda, Produto)
ORDER BY GROUPING(Produto);


-- Qual a combinação de vendedor e produto gerou mais vendas (incluindo todos os subtotais possíveis)?

SELECT 
    CASE 
        WHEN Vendedor IS NULL THEN 'Todos os Vendedores' 
        ELSE Vendedor 
    END AS Vendedor,
    CASE 
        WHEN Produto IS NULL THEN 'Todos os Produtos' 
        ELSE Produto 
    END AS Produto,
    SUM(Quantidade * ValorUnitario) AS TotalVendas
FROM vendas
GROUP BY CUBE (Vendedor, Produto)
ORDER BY GROUPING(Vendedor), Produto;


-- Analisar as vendas totais por Produto, por Vendedor e também o total geral de todas as vendas. 
SELECT 
    COALESCE(Produto, 'Todos') AS Produto, 
    COALESCE(Vendedor, 'Todos') AS Vendedor, 
    SUM(Quantidade * ValorUnitario) AS TotalVendas
FROM vendas
GROUP BY GROUPING SETS ((Produto), (Vendedor), ());











