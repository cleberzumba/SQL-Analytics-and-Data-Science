


-- Criando a tabela 'fornecedores'
CREATE TABLE fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    email VARCHAR(255),
    data_registro DATE
);


-- Inserindo registros na tabela 'funcionarios'
INSERT INTO fornecedores (nome, cidade, estado, email, data_registro) VALUES
('Fornecedor 1', 'São Paulo', 'SP', 'fornecedor1@exemplo.com', '2023-09-01'),
('Fornecedor 2', 'Rio de Janeiro', 'RJ', 'fornecedor2@exemplo.com', '2023-09-02'),
('Fornecedor 3', 'Belo Horizonte', 'MG', 'fornecedor3@exemplo.com', '2023-09-03'),
('Fornecedor 4', 'Porto Alegre', 'RS', 'fornecedor4@exemplo.com', '2023-09-04'),
('Fornecedor 5', 'Curitiba', 'PR', 'fornecedor5@exemplo.com', '2023-09-05'),
('Fornecedor 6', 'Recife', 'PE', 'fornecedor6@exemplo.com', '2023-09-06'),
('Fornecedor 7', 'Salvador', 'BA', 'fornecedor7@exemplo.com', '2023-10-07'),
('Fornecedor 8', 'Fortaleza', 'CE', 'fornecedor8@exemplo.com', '2023-10-08'),
('Fornecedor 9', 'Goiânia', 'GO', 'fornecedor9@exemplo.com', '2023-10-09'),
('Fornecedor 10', 'Manaus', 'AM', 'fornecedor10@exemplo.com', '2023-10-10');
