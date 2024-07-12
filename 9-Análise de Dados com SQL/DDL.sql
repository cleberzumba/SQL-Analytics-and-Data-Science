
-- Os dados dessas tabelas foram carregados por meio de datasets em formato "csv". Esses datasets estao dispoviveis tambem.

-- Cria as tabelas:
CREATE TABLE ods.clientes (
    Id_Cliente UUID PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE ods.produtos (
    Id_Produto UUID PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL
);

CREATE TABLE ods.vendas (
    Id_Vendas UUID PRIMARY KEY,
    Id_Cliente UUID REFERENCES cap17.clientes(Id_Cliente),
    Id_Produto UUID REFERENCES cap17.produtos(Id_Produto),
    Quantidade INTEGER,
    Data_Venda DATE
);