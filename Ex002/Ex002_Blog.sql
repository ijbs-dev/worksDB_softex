-- Tarefa 1: Criar o banco de dados BlogDB
CREATE DATABASE BlogDB;

-- Usar o banco de dados criado
USE BlogDB;

-- Tabela "Autor"
CREATE TABLE Autor (
    AutorID INT PRIMARY KEY,
    NomeAutor VARCHAR(255),
    Email VARCHAR(255)
);

-- Tabela "Post"
CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Conteudo TEXT,
    DataPublicacao DATE,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
);

-- Tabela "Comentario"
CREATE TABLE Comentario (
    ComentarioID INT PRIMARY KEY,
    TextoComentario TEXT,
    DataComentario DATE,
    AutorID INT,
    PostID INT,
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

-- Um post é escrito por um autor
ALTER TABLE Post
ADD CONSTRAINT FK_Post_Autor
FOREIGN KEY (AutorID)
REFERENCES Autor(AutorID);

-- Um autor pode escrever vários posts
ALTER TABLE Post
ADD CONSTRAINT FK_Autor_Post
FOREIGN KEY (AutorID)
REFERENCES Autor(AutorID);

-- Um post pode ter vários comentários
ALTER TABLE Comentario
ADD CONSTRAINT FK_Post_Comentario
FOREIGN KEY (PostID)
REFERENCES Post(PostID);

-- Um comentário é escrito por um autor
ALTER TABLE Comentario
ADD CONSTRAINT FK_Autor_Comentario
FOREIGN KEY (AutorID)
REFERENCES Autor(AutorID);
