


-- Query para comparar em um relatório os dados de vendas diárias com a média móvel
-- Considere janela de 3 dias para a média móvel
SELECT data_venda, 
       valor_venda,
       ROUND(AVG(valor_venda) OVER (ORDER BY data_venda ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 2) as media_movel
FROM vendas_temporais;

-- Query para comparar em um relatório os dados de vendas diárias com a média móvel
-- Considere janela de 7 dias para a média móvel
SELECT data_venda, 
       valor_venda,
       ROUND(AVG(valor_venda) OVER (ORDER BY data_venda ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING), 2) as media_movel
FROM vendas_temporais;

-- Query que mostre o crescimento das vendas diárias em relação ao dia anterior
SELECT data_venda, 
       valor_venda,
       coalesce(valor_venda - LAG(valor_venda) OVER (ORDER BY data_venda), 0) as valor_vendas_anterior
FROM vendas_temporais;

-- Query que mostre a soma acumulada de vendas dia a dia
SELECT data_venda, 
       valor_venda,
       SUM(valor_venda) OVER (PARTITION BY EXTRACT(MONTH FROM data_venda) ORDER BY data_venda) as soma_acumulada
FROM vendas_temporais;

-- Ranking de vendas por funcionário considerando o valor total de vendas por dia e de cada funcionário
SELECT 
    *,
    DENSE_RANK() OVER (PARTITION BY funcionario_id ORDER BY valor_venda DESC) as rank_vendas
FROM 
    (SELECT data_venda, funcionario_id, SUM(valor_venda) as valor_venda
     FROM vendas_temporais
     GROUP BY data_venda, funcionario_id) as subquery
ORDER BY funcionario_id, rank_vendas;












