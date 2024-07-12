

-- Cria a tabela
CREATE TABLE vendas_temporais (
    id SERIAL PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    funcionario_id INT NOT NULL
);


-- Insere os registros
INSERT INTO vendas_temporais (data_venda, valor_venda, funcionario_id) VALUES
('2025-01-01', 175.00, 1001),
('2025-01-02', 155.00, 1001),
('2025-01-03', 321.00, 1002),
('2025-01-04', 254.00, 1001),
('2025-01-05', 189.00, 1002),
('2025-01-05', 182.00, 1002),
('2025-01-05', 183.00, 1002),
('2025-01-06', 190.00, 1003),
('2025-01-07', 190.00, 1003),
('2025-01-08', 245.00, 1004),
('2025-01-09', 456.00, 1005),
('2025-01-09', 230.00, 1005),
('2025-01-09', 150.00, 1003),
('2025-01-10', 157.00, 1002),
('2025-01-10', 188.00, 1001);
