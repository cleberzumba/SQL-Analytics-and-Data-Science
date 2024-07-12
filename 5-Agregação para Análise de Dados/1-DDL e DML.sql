


CREATE TABLE sales (
    ID INT PRIMARY KEY,
    DataVenda DATE,
    Produto VARCHAR(50),
    Quantidade INT,
    ValorUnitario DECIMAL(10, 2),
    Vendedor VARCHAR(50)
);


-- Insert
INSERT INTO sales (ID, DataVenda, Produto, Quantidade, ValorUnitario, Vendedor) VALUES
(1, '2023-11-01', 'Produto A', 10, 100.00, 'Arthur'),
(2, '2023-11-01', 'Produto B', 5, 200.00, 'Clark'),
(3, '2023-11-02', 'Produto A', 7, 100.00, 'Michael'),
(4, '2023-11-02', 'Produto C', 3, 150.00, 'Thomas'),
(5, '2023-11-03', 'Produto B', 8, 200.00, 'Clark'),
(6, '2023-11-03', 'Produto A', 5, 100.00, 'Arthur'),
(7, '2023-11-04', 'Produto C', 10, 150.00, 'Thomas'),
(8, '2023-11-04', 'Produto A', 2, 100.00, 'Michael'),
(9, '2023-11-05', 'Produto B', 6, 200.00, 'Clark'),
(10, '2023-11-05', 'Produto C', 4, 150.00, 'Thomas');
