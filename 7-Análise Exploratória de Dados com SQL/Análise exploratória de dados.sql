


-- Sumarização de Dados
=======================
-- Query mostrando diversas métricas por centro de custo
-- A query deve mostrar: contagem_lancamentos, total_valores_lançamentos, media_valores_lançamentos, maior_valor, menor_valor
-- soma_valores_usd, soma_valores_eur, soma_valores_brl, media_taxa_conversao e mediana_valores

SELECT
    centro_custo,
    COUNT(*) AS contagem_lancamentos,
    SUM(valor) AS total_valores_lançamentos,
    ROUND(AVG(valor), 2) AS media_valores_lançamentos,
    MAX(valor) AS maior_valor,
    MIN(valor) AS menor_valor,
    SUM(CASE WHEN moeda = 'USD' THEN valor ELSE 0 END) AS soma_valores_usd,
    SUM(CASE WHEN moeda = 'EUR' THEN valor ELSE 0 END) AS soma_valores_eur,
    SUM(CASE WHEN moeda = 'BRL' THEN valor ELSE 0 END) AS soma_valores_brl,
    ROUND(AVG(CASE WHEN taxa_conversao IS NOT NULL THEN taxa_conversao ELSE 0 END), 2) AS media_taxa_conversao,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor) AS mediana_valores
FROM lancamentoscontabeis
GROUP BY centro_custo
ORDER BY total_valores_lançamentos DESC;


-- Distribuição de Dados
========================
-- Query para mostrar a distribuição de dados na tabela. 
-- O foco é na coluna valor.
-- o relatório deve mostrar: quantidade_lancamentos, media_valor, desvio_padrao_valor, menor_valor, 
-- maior_valor e primeiro quartil, segundo(valor do meio - mediana) e terceiro quartil.
-- Faça tudo isso por centro de custo e por moeda.

-- obs: desvio padrão indica quão distante os dados estão da média.
-- obs: somente com os dados ordenados eu consigo calcular os percentis

SELECT
    centro_custo,
    moeda,
    COUNT(*) AS quantidade_lancamentos,
    ROUND(AVG(valor)::NUMERIC, 2) AS media_valor,
    ROUND(STDDEV(valor)::NUMERIC, 2) AS desvio_padrao_valor,
    MIN(valor) AS menor_valor,
    MAX(valor) AS maior_valor,
    ROUND((PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor))::NUMERIC, 2) AS primeiro_quartil,
    ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor))::NUMERIC, 2) AS mediana,
    ROUND((PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor))::NUMERIC, 2) AS terceiro_quartil
FROM lancamentoscontabeis
GROUP BY centro_custo, moeda
ORDER BY centro_custo, moeda;


-- Análise Multivariada (mais de uma coluna no mesmo tempo)
===========================================================
-- Os requisitos do relatório:
-- Calcule valor total dos lançamentos
-- Calcule a média dos lançamentos
-- Calcule a contagem dos lançamentos
-- Calcule a média do valor de taxa de conversão somente se a moeda for diferente de BRL
-- Crie ranking por valor total dos lançamentos, por média do valor dos lançamentos e por média da taxa de conversão
-- Apenas quando o centro de custo for Compras ou RH 

SELECT
    A.centro_custo,
    A.moeda,
    SUM(A.valor) AS total_valor_lancamento,
    DENSE_RANK() OVER (ORDER BY SUM(A.valor) DESC) AS rank_total_valor,
    ROUND(AVG(A.valor), 2) AS media_valor_lancamento,
    DENSE_RANK() OVER (ORDER BY AVG(A.valor) DESC) AS rank_media_valor,
    COUNT(A.*) AS numero_de_lancamentos,
    COALESCE(ROUND(AVG(A.taxa_conversao) FILTER (WHERE A.moeda != 'BRL'),2), 0) AS media_taxa_conversao,
    DENSE_RANK() OVER (ORDER BY COALESCE(ROUND(AVG(A.taxa_conversao) FILTER (WHERE A.moeda != 'BRL'),2), 0) DESC) AS rank_media_taxa
FROM lancamentoscontabeis A
WHERE A.centro_custo IN ('Compras', 'RH')
GROUP BY A.centro_custo, A.moeda
ORDER BY rank_total_valor, rank_media_valor, rank_media_taxa
    
--ou dessa outra forma:

SELECT centro_custo, 
       moeda,
       total_valor_lancamento,
       DENSE_RANK() OVER (ORDER BY total_valor_lancamento DESC) AS rank_total_valor,
       media_valor_lancamento,
       DENSE_RANK() OVER (ORDER BY media_valor_lancamento DESC) AS rank_media_valor,
       numero_de_lancamentos,
       media_taxa_conversao,
       DENSE_RANK() OVER (ORDER BY media_taxa_conversao DESC) AS rank_media_taxa
FROM (
    SELECT
        A.centro_custo AS centro_custo,
        A.moeda AS moeda,
        SUM(A.valor) AS total_valor_lancamento,    
        ROUND(AVG(A.valor), 2) AS media_valor_lancamento,    
        COUNT(A.*) AS numero_de_lancamentos,
        COALESCE(ROUND(AVG(A.taxa_conversao) FILTER (WHERE A.moeda != 'BRL'),2), 0) AS media_taxa_conversao    
    FROM lancamentoscontabeis A
    WHERE A.centro_custo IN ('Compras', 'RH')
    GROUP BY A.centro_custo, A.moeda) subquery
ORDER BY rank_total_valor, rank_media_valor, rank_media_taxa



    

-- Identificação de Outliers
============================
-- Vamos analisar a coluna valor
-- Para melhorar a análise, vamos observar os outliers por centro de custo e moeda
-- Para identificar outliers na tabela podemos usar uma abordagem baseada em Estatística, 
-- como calcular o intervalo interquartil (IQR) e identificar valores que estão significativamente 
-- acima ou abaixo desse intervalo. 
-- O IQR é a diferença entre o primeiro quartil (Q1, o 25º percentil) e o terceiro quartil (Q3, o 75º percentil). 
-- Os valores abaixo de Q1 - 0.5 * IQR ou acima de Q3 + 0.5 * IQR serão considerados outliers.
-- Crie a query que identifique os outliers (se existirem), por centro de custo e moeda.

SELECT 
    centro_custo,
    moeda,
    MIN(VALOR) as minimo_valor,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor) - 0.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor)) AS limite_inferior,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor) AS q1,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY valor) AS q2,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor) AS q3,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor) + 0.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor)) AS limite_superior,
    MAX(valor) as maximo_valor
FROM lancamentoscontabeis
GROUP BY centro_custo, moeda;

WITH Estatisticas AS (
    SELECT
        centro_custo,
        moeda,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor) AS q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor) AS q3
    FROM lancamentoscontabeis
    GROUP BY centro_custo, moeda
),
LimitesOutliers AS (
    SELECT
        centro_custo,
        moeda,
        q1,
        q3,
        q1 - 0.5 * (q3 - q1) AS limite_inferior,
        q3 + 0.5 * (q3 - q1) AS limite_superior
    FROM Estatisticas
)
SELECT
    L.id,
    L.data_lancamento,
    L.centro_custo,
    L.moeda,
    L.valor
FROM lancamentoscontabeis L
INNER JOIN LimitesOutliers E 
        ON L.centro_custo = E.centro_custo AND L.moeda = E.moeda
WHERE L.valor < E.limite_inferior OR L.valor > E.limite_superior
ORDER BY L.valor, L.centro_custo, L.moeda;

