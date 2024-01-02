create schema if not exists softexTestes;
use softexTestes;

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(255),
    Preco DECIMAL(10, 2),
    QuantidadeEmEstoque INT
);

-- Usando DML
-- Inserir produtos na tabela "Produtos"
INSERT INTO Produtos (ProdutoID, NomeProduto, Preco, QuantidadeEmEstoque) VALUES
(1, 'Smartphone', 799.99, 20),
(2, 'Tablet', 349.99, 10),
(3, 'Fone de Ouvido', 49.99, 50);

-- Atualizar estoque e preço do "Smartphone"
UPDATE Produtos
SET QuantidadeEmEstoque = 25, Preco = 849.99
WHERE ProdutoID = 1;

select*from Produtos;

