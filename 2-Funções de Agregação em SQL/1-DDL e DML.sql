


-- Criando a tabela 'clientes'
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    data_nascimento DATE
);


-- Inserindo registros na tabela 'clientes'
INSERT INTO clientes (nome, email, cidade, estado, data_nascimento) VALUES
('Carlos Silva', 'carlos.silva@exemplo.com', 'São Paulo', 'SP', '1980-05-15'),
('Maria Oliveira', 'maria.oliveira@exemplo.com', 'Rio de Janeiro', 'RJ', '1990-08-20'),
('João Pereira', 'joao.pereira@exemplo.com', 'Belo Horizonte', 'MG', '1985-11-30'),
('Ana Santos', '', 'Curitiba', 'PR', '1975-02-28'),
('Paulo Souza', 'paulo.souza@exemplo.com', 'Porto Alegre', 'RS', '1995-06-10'),
('Fernanda Barbosa', '', 'Salvador', 'BA', '1983-07-15'),
('Rodrigo Lima', 'rodrigo.lima@exemplo.com', 'Recife', 'PE', '1988-12-05'),
('Aline Teixeira', '', 'Fortaleza', 'CE', '1992-04-18'),
('Renato Gonçalves', 'renato.goncalves@exemplo.com', 'Goiânia', 'GO', '1978-09-12'),
('Patrícia Alves', 'patricia.alves@exemplo.com', 'São Luís', 'MA', '1987-03-22'),
('Ricardo Martins', 'ricardo.martins@exemplo.com', 'Natal', 'RN', '1993-01-19'),
('Sandra Ferreira', 'sandra.ferreira@exemplo.com', 'João Pessoa', 'PB', '1970-10-31'),
('Thiago Correia', 'thiago.correia@exemplo.com', 'Aracaju', 'SE', '1996-08-07'),
('Fábio Azevedo', 'fabio.azevedo@exemplo.com', 'Maceió', 'AL', '1982-05-21'),
('Juliana Castro', 'juliana.castro@exemplo.com', 'Teresina', 'PI', '1989-06-14');