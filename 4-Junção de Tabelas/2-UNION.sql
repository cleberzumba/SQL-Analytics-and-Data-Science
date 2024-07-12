


-- UNION: Este operador é usado para combinar os resultados de duas ou mais consultas SELECT em um único conjunto de resultados. 
-- Ele elimina duplicatas por padrão.
-- Se queremos obter uma lista de todos os estudantes, sem repetições:
SELECT nome FROM estudantes_ensino_medio
UNION
SELECT nome FROM estudantes_universidade;


-- UNION ALL: Semelhante ao UNION, ele combina os resultados de duas ou mais consultas SELECT em um único conjunto de resultados. 
-- No entanto, ele não remove duplicatas.
-- Se quisermos obter uma lista de todos os estudantes, incluindo repetições:
SELECT nome FROM estudantes_ensino_medio
UNION ALL
SELECT nome FROM estudantes_universidade;


-- E o que fazer quando não há correspondência de colunas?
SELECT nome, 'Não se aplica' AS especilidade FROM estudantes_ensino_medio
UNION ALL
SELECT nome, especialidade FROM estudantes_universidade;


