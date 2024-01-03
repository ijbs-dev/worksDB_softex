
CREATE SCHEMA IF NOT EXISTS transacoes;
use transacoes;

CREATE TABLE transacoes (
    ID_Transacao INT PRIMARY KEY,
    Data_Transacao DATE,
    Valor_Transacao DECIMAL(10, 2),
    Produto VARCHAR(255),
    Categoria VARCHAR(255)
);

-- Inserir alguns dados para teste
INSERT INTO transacoes (ID_Transacao, Data_Transacao, Valor_Transacao, Produto, Categoria)
VALUES
    (1, '2023-01-01', 150.00, 'Produto_A', 'Categoria_1'),
    (2, '2023-01-02', 80.00, 'Produto_B', 'Categoria_2'),
    (3, '2023-01-03', 120.00, 'Produto_A', 'Categoria_1'),
    (4, '2023-01-04', 200.00, 'Produto_C', 'Categoria_3'),
    (5, '2023-01-05', 90.00, 'Produto_B', 'Categoria_2');


-- ------------------------------------------------------------------------------------------------------------------------
-- 1. Seleção de Dados:
   
   SELECT * FROM transacoes;
   
-- 2. Renomeando Colunas:
   
   SELECT
     ID_Transacao AS ID,
     Data_Transacao AS Data,
     Valor_Transacao AS Valor
   FROM transacoes;
   
-- 3. Filtragem com a Cláusula WHERE:
   
   SELECT * FROM transacoes
   WHERE Valor_Transacao > 100.00;
   
-- 4. Ordenação com a Cláusula ORDER BY:
   
   SELECT * FROM transacoes
   ORDER BY Valor_Transacao DESC;
   
-- 5. Agregação com Funções :
   
   SELECT
     AVG(Valor_Transacao) AS Media,
     MAX(Valor_Transacao) AS Valor_Maximo,
     MIN(Valor_Transacao) AS Valor_Minimo,
     COUNT(*) AS Total_Transacoes
   FROM transacoes;
   
-- 6. Agrupamento com a Cláusula GROUP BY:
   
   SELECT
     Produto,
     AVG(Valor_Transacao) AS Media_Valor_Por_Produto
   FROM transacoes
   GROUP BY Produto;
   
-- 7. Consulta Combinada:
   
   SELECT
     Categoria,
     COUNT(*) AS Total_Produtos,
     SUM(Valor_Transacao) AS Valor_Total_Vendas,
     AVG(Valor_Transacao) AS Media_Valor_Por_Transacao
   FROM transacoes
   GROUP BY Categoria;
   
