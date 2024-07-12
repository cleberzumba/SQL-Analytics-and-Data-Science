


-- Pergunta 1: Quantos clientes estão registrados por estado?

SELECT estado, COUNT(*) AS numero_de_clientes
FROM clientes
GROUP BY estado;


-- Pergunta 2: Qual é a idade média dos clientes?
SELECT ROUND(AVG(EXTRACT(YEAR FROM AGE(data_nascimento)))) AS idade_media
FROM clientes;


-- Pergunta 3: Quantos clientes têm mais de 30 anos?

SELECT COUNT(*) AS clientes_mais_30
FROM clientes
WHERE EXTRACT(YEAR FROM AGE(current_date, data_nascimento)) > 30;


-- Pergunta 4: Quais são as 3 cidades com o maior número de clientes?

SELECT cidade, COUNT(*) AS numero_de_clientes
FROM clientes
GROUP BY cidade
ORDER BY numero_de_clientes DESC
LIMIT 3;


-- Pergunta 5: Quantos clientes têm um endereço de e-mail registrado?

SELECT COUNT(*) 
FROM clientes 
WHERE email <> '';















