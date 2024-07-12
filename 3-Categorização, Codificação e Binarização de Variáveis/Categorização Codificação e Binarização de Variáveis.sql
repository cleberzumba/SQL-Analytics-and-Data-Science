


-- Visualiza os dados
SELECT * FROM pacientes;



=> Binarização:
---------------

-- Valores distintos
SELECT DISTINCT classe FROM pacientes;


-- Binarização da variável classe (0/1)
SELECT 
  CASE 
    WHEN classe = 'sem-recorrencia-eventos' THEN 0 
    WHEN classe = 'com-recorrencia-eventos' THEN 1
  END AS classe
FROM pacientes;


-- Valores distintos
SELECT DISTINCT irradiando FROM pacientes;


-- Binarização da variável irradiando (0/1)
SELECT 
  CASE 
    WHEN irradiando = 'não' THEN 0 
    WHEN irradiando = 'sim' THEN 1
  END AS irradiando
FROM pacientes;


-- Binarização da variável node_caps (0/1)
SELECT DISTINCT node_caps FROM pacientes;

SELECT 
  CASE 
    WHEN node_caps = 'não' THEN 0 
    WHEN node_caps = 'sim' THEN 1
  END AS node_caps
FROM pacientes;



=> Categorizaçao:
-----------------

-- Valores distintos
SELECT DISTINCT seio FROM pacientes;


-- Categorização da variável seio (E/D)
SELECT 
  CASE 
    WHEN seio = 'esquerdo' THEN 'E' 
    WHEN seio = 'direito' THEN 'D'
  END AS seio
FROM pacientes;



-- Valores distintos
SELECT DISTINCT tamanho_tumor FROM pacientes;
SELECT DISTINCT tamanho_tumor FROM pacientes ORDER BY tamanho_tumor;


-- Categorização da variável tamanho_tumor (6 Categorias)
SELECT 
  CASE 
    WHEN tamanho_tumor = '0-4'   OR tamanho_tumor = '5-9'   THEN 'Muito Pequeno'
    WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
    WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
    WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
    WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
    WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
  END AS tamanho_tumor
FROM pacientes;




=> Label Encoding:
------------------

-- Label Encoding da variável seio (1/2)
SELECT 
  CASE 
    WHEN seio = 'esquerdo' THEN '1' 
    WHEN seio = 'direito' THEN '2'
  END AS seio
FROM pacientes;

-- Label Encoding da variável tamanho_tumor (6 Categorias)
SELECT 
  CASE 
    WHEN tamanho_tumor = '0-4'   OR tamanho_tumor = '5-9'   THEN '1'
    WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN '2'
    WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN '3'
    WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN '4'
    WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN '5'
    WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN '6'
  END AS tamanho_tumor
FROM pacientes;


-- Valores distintos
SELECT DISTINCT quadrante FROM pacientes;


-- Label Encoding da variável quadrante (1,2,3,4,5)
SELECT 
  CASE 
    WHEN quadrante = 'esquerdo_inferior' THEN 1 
    WHEN quadrante = 'direito_superior' THEN 2 
    WHEN quadrante = 'esquerdo_superior' THEN 3
    WHEN quadrante = 'direito_inferior' THEN 4
    WHEN quadrante = 'central' THEN 5
    ELSE 6
  END AS quadrante
FROM pacientes;




=> One-Hot Encoding:
--------------------

-- Valores distintos
SELECT DISTINCT menopausa FROM pacientes;


-- One-Hot Encoding (criação de variáveis dummy)
SELECT 
    menopausa,
    CASE 
        WHEN menopausa = 'acima_de_40' THEN 1 
        ELSE 0 
    END AS acima_de_40,
    CASE 
        WHEN menopausa = 'pré-menopausa' THEN 1 
        ELSE 0 
    END AS pre_menopausa,
    CASE 
        WHEN menopausa = 'abaixo_de_40' THEN 1 
        ELSE 0 
    END AS abaixo_de_40
FROM pacientes;




=> Resultado final:
-------------------

-- Query com todas as transformações
SELECT 
  CASE 
    WHEN classe = 'sem-recorrencia-eventos' THEN 0 
    WHEN classe = 'com-recorrencia-eventos' THEN 1
  END as classe,
  CASE 
    WHEN tamanho_tumor = '0-4'   OR tamanho_tumor = '5-9'   THEN '1'
    WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN '2'
    WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN '3'
    WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN '4'
    WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN '5'
    WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN '6'
  END AS tamanho_tumor,
  CASE 
    WHEN node_caps = 'não' THEN 0 
    WHEN node_caps = 'sim' THEN 1
    ELSE 2
  END AS node_caps,
  deg_malig,
  CASE 
    WHEN seio = 'esquerdo' THEN '1' 
    WHEN seio = 'direito' THEN '2'
  END AS seio,
  CASE 
    WHEN quadrante = 'esquerdo_inferior' THEN 1 
    WHEN quadrante = 'direito_superior' THEN 2 
    WHEN quadrante = 'esquerdo_superior' THEN 3
    WHEN quadrante = 'direito_inferior' THEN 4
    WHEN quadrante = 'central' THEN 5
    ELSE 6
  END AS quadrante,
  CASE 
    WHEN irradiando = 'não' THEN 0 
    WHEN irradiando = 'sim' THEN 1
  END AS irradiando,
  CASE 
    WHEN menopausa = 'acima_de_40' THEN 1 
    ELSE 0 
  END AS acima_de_40,
  CASE 
    WHEN menopausa = 'pré-menopausa' THEN 1 
    ELSE 0 
  END AS pre_menopausa,
  CASE 
    WHEN menopausa = 'abaixo_de_40' THEN 1 
    ELSE 0 
  END AS abaixo_de_40
FROM pacientes;


-- Cria uma nova tabela
CREATE TABLE pacientes_resultado
AS
SELECT 
  CASE 
    WHEN classe = 'sem-recorrencia-eventos' THEN 0 
    WHEN classe = 'com-recorrencia-eventos' THEN 1
  END as classe,
  CASE 
    WHEN tamanho_tumor = '0-4'   OR tamanho_tumor = '5-9'   THEN '1'
    WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN '2'
    WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN '3'
    WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN '4'
    WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN '5'
    WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN '6'
  END AS tamanho_tumor,
  CASE 
    WHEN node_caps = 'não' THEN 0 
    WHEN node_caps = 'sim' THEN 1
    ELSE 2
  END AS node_caps,
  deg_malig,
  CASE 
    WHEN seio = 'esquerdo' THEN '1' 
    WHEN seio = 'direito' THEN '2'
  END AS seio,
  CASE 
    WHEN quadrante = 'esquerdo_inferior' THEN 1 
    WHEN quadrante = 'direito_superior' THEN 2 
    WHEN quadrante = 'esquerdo_superior' THEN 3
    WHEN quadrante = 'direito_inferior' THEN 4
    WHEN quadrante = 'central' THEN 5
    ELSE 6
  END AS quadrante,
  CASE 
    WHEN irradiando = 'não' THEN 0 
    WHEN irradiando = 'sim' THEN 1
  END AS irradiando,
  CASE 
    WHEN menopausa = 'acima_de_40' THEN 1 
    ELSE 0 
  END AS acima_de_40,
  CASE 
    WHEN menopausa = 'pré-menopausa' THEN 1 
    ELSE 0 
  END AS pre_menopausa,
  CASE 
    WHEN menopausa = 'abaixo_de_40' THEN 1 
    ELSE 0 
  END AS abaixo_de_40
FROM pacientes;


-- Consulta a tabela
SELECT * FROM pacientes_resultado;











