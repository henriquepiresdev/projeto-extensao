
CREATE DATABASE ajuda_comunitaria;

\c ajuda_comunitaria;

CREATE TABLE tipos_usuarios (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

INSERT INTO tipos_usuarios (tipo) 
VALUES ('admin'), ('gerente'), ('org'), ('voluntario'), ('usuario');

CREATE TABLE enderecos (
    id SERIAL PRIMARY KEY,
    rua VARCHAR(255),
    numero VARCHAR(10),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(20),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    endereco_id INT REFERENCES enderecos(id),
    tipo_usuario_id INT REFERENCES tipos_usuarios(id) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE auxiliados (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT,
    genero VARCHAR(50),
    documento_identidade VARCHAR(50),
    telefone VARCHAR(20),
    endereco_id INT REFERENCES enderecos(id), 
    usuario_id INT REFERENCES usuarios(id),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE acoes_ajuda (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_evento DATE NOT NULL,
    endereco_id INT REFERENCES enderecos(id),
    usuario_id INT REFERENCES usuarios(id), 
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
