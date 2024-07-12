


-- Relatório de Resumo Com Variáveis Quantitativas
-- Totais dos anos 2022, 2023 e 2024 para as colunas orcamento, taxa_conversao e impressoes

SELECT
    TO_CHAR(data_inicio, 'YYYY') AS ano,
    SUM(orcamento) AS total_orcamento,
    SUM(taxa_conversao) AS total_taxa_conversao,
    SUM(impressoes) AS total_impressoes
FROM campanha_marketing
WHERE EXTRACT(YEAR FROM data_inicio) IN (2022, 2023, 2024)
GROUP BY TO_CHAR(data_inicio, 'YYYY')
ORDER BY TO_CHAR(data_inicio, 'YYYY') DESC;


-- Relatório de Resumo Com Variáveis Quantitativas e Pivot da Tabela

SELECT
    'Total' as Total,
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2022 THEN orcamento ELSE 0 END) AS "Orcamento_2022",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2022 THEN taxa_conversao ELSE 0 END) AS "Taxa_Conversao_2022",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2022 THEN impressoes ELSE 0 END) AS "Impressoes_2022",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2023 THEN orcamento ELSE 0 END) AS "Orcamento_2023",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2023 THEN taxa_conversao ELSE 0 END) AS "Taxa_Conversao_2023",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2023 THEN impressoes ELSE 0 END) AS "Impressoes_2023",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2024 THEN orcamento ELSE 0 END) AS "Orcamento_2024",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2024 THEN taxa_conversao ELSE 0 END) AS "Taxa_Conversao_2024",
    SUM(CASE WHEN EXTRACT(YEAR FROM data_inicio) = 2024 THEN impressoes ELSE 0 END) AS "Impressoes_2024"
FROM campanha_marketing;


