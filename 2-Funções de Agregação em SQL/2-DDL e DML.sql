


-- Criando a tabela 'produtos'
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(10, 2),
    quantidade INT,
    categoria VARCHAR(255),
    data_criacao DATE
);


-- Inserindo registros na tabela 'produtos'
INSERT INTO produtos (nome, preco, quantidade, categoria, data_criacao) VALUES
('Produto A', 25.50, 100, 'Categoria 1', '2023-01-01'),
('Produto B', 15.75, 200, 'Categoria 1', '2023-01-02'),
('Produto C', 30.00, 150, 'Categoria 2', '2023-01-03'),
('Produto D', 10.00, 250, 'Categoria 2', '2023-01-04'),
('Produto E', 8.50, 300, 'Categoria 3', '2023-01-05'),
('Produto F', 19.99, 120, 'Categoria 3', '2023-01-06'),
('Produto G', 45.00, 80, 'Categoria 4', '2023-01-07'),
('Produto H', 60.00, 70, 'Categoria 4', '2023-01-08'),
('Produto I', 12.99, 200, 'Categoria 5', '2023-01-09'),
('Produto J', 7.50, 330, 'Categoria 5', '2023-01-10'),
('Produto K', 22.00, 110, 'Categoria 1', '2023-01-11'),
('Produto L', 31.25, 90, 'Categoria 2', '2023-01-12'),
('Produto M', 40.00, 60, 'Categoria 3', '2023-01-13'),
('Produto N', 55.00, 50, 'Categoria 4', '2023-01-14'),
('Produto O', 20.00, 130, 'Categoria 5', '2023-01-15');
