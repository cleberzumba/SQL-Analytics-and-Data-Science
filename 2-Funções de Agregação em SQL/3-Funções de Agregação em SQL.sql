



-- Qual é o estado com o maior número de fornecedores?

SELECT estado
FROM fornecedores
GROUP BY estado
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Quantos fornecedores foram registrados no mês de Setembro de 2023?

SELECT COUNT(*) AS fornecedores_registrados_apos_jan
FROM fornecedores
WHERE data_registro >= '2023-09-01' 
  AND data_registro <= '2023-09-30';


-- Qual é a média de registros de fornecedores por mês?

SELECT ROUND(AVG(qtd), 0) AS media_registros_por_mes
FROM (
    SELECT EXTRACT(MONTH FROM data_registro) AS mes, COUNT(*) AS qtd
    FROM fornecedores
    GROUP BY EXTRACT(MONTH FROM data_registro)
) AS subquery;


-- Qual é o fornecedor mais recente registrado?

SELECT nome, data_registro
FROM fornecedores
WHERE data_registro = (SELECT MAX(data_registro) FROM fornecedores);















