

-- Cria a tabela
CREATE TABLE estudantes_ensino_medio (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);


-- Insere registros na tabela
INSERT INTO estudantes_ensino_medio (nome) VALUES ('Jqueline');
INSERT INTO estudantes_ensino_medio (nome) VALUES ('Clark');
INSERT INTO estudantes_ensino_medio (nome) VALUES ('Juliana');


-- Cria a tabela
CREATE TABLE cap08.estudantes_universidade  (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255) NOT NULL
);


-- Insere registros na tabela
INSERT INTO estudantes_universidade (nome, especialidade) VALUES ('Clark', 'Direito');
INSERT INTO estudantes_universidade (nome, especialidade) VALUES ('Maria', 'Medicina');
INSERT INTO estudantes_universidade (nome, especialidade) VALUES ('Thomas', 'Engenharia');
