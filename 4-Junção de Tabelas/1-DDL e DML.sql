


-- Criação da tabela Autores
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE
);


-- Criação da tabela Livros
CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT
);


-- Criação da tabela LivrosAutores
CREATE TABLE livros_vendidos (
    id_livro INT NOT NULL REFERENCES cap08.livros(id_livro),
    id_autor INT NOT NULL REFERENCES cap08.autores(id_autor),
    PRIMARY KEY (id_livro, id_autor)
);


-- Inserindo registros na tabela de autores
INSERT INTO autores (nome, data_nascimento) VALUES
('Yuval Noah Harari', '1976-02-24'),
('Leonard Mlodinow', '1954-11-26'),
('Dale Carnegie', '1888-11-24'),
('Stephen R. Covey', '1932-10-24');


-- Inserindo registros na tabela de livros
INSERT INTO livros (titulo, ano_publicacao) VALUES
('Sapiens - Uma breve história da humanidade', 2020),
('21 lições para o século 21', 2018),
('O andar do bêbado: Como o acaso determina nossas vidas', 2018),
('Uma breve história do tempo', 2015),
('Os 7 Hábitos das Pessoas Altamente Eficazes', 2017);


-- Inserindo registros na tabela de LivrosAutores
INSERT INTO livros_vendidos (id_livro, id_autor) VALUES
(1, 1), 
(3, 2), 
(5, 4); 
