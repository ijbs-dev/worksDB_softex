CREATE SCHEMA IF NOT EXISTS `livros`;
USE livros;

CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Nacionalidade VARCHAR(255)
);

CREATE TABLE Livros (
    LivroID INT PRIMARY KEY,
    Titulo VARCHAR(255),
    AnoPublicacao DATE,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID) ON DELETE RESTRICT
);

-- 1) Inserção de dados
INSERT INTO Autores (AutorID, Nome, Nacionalidade) VALUES
(1, 'Carlos Silva', 'Brasileiro'),
(2, 'Clarice Camargo', 'Americano'),
(3, 'Ariano Xavier', 'Indiano');

-- Inserção de dados
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, AutorID) VALUES
(1, 'Dom Casmurro', '1900-01-01', 1),
(2, '1984', '1949-06-08', 2),
(3, 'Memórias Póstumas de Brás Cubas', '1881-12-15', 1),
(4, 'O Príncipe', '1532-12-10', 3),
(5, 'A Revolução dos Bichos', '1945-08-17', 2);

-- 2) Consulta simples
SELECT * FROM Autores;
SELECT * FROM Livros;

-- 3) Consulta com junção INNER JOIN
SELECT Livros.LivroID, Livros.Titulo, Livros.AnoPublicacao, Autores.Nome
FROM Livros
INNER JOIN Autores ON Livros.AutorID = Autores.AutorID;

-- 4) Consulta com junção LEFT JOIN
SELECT Autores.AutorID, Autores.Nome, Livros.LivroID, Livros.Titulo
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID;

-- 5) Consulta com filtro por nacionalidade
SELECT Autores.AutorID, Autores.Nome, Livros.LivroID, Livros.Titulo
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
WHERE Autores.Nacionalidade = 'Nacionalidade1';

-- 6) Consulta agregada
SELECT Autores.AutorID, Autores.Nome, COUNT(Livros.LivroID) AS QuantidadeLivros
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
GROUP BY Autores.AutorID, Autores.Nome;
