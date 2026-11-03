-- GESTÃO À VISTA | 01 - Preparação inicial
-- Execute apenas em um banco local de TREINAMENTO.
-- A base fictícia de 60 demandas deve ser importada do CSV.
CREATE DATABASE IF NOT EXISTS gestao_a_vista CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gestao_a_vista;

-- Estrutura compatível com o CSV de treinamento (datas recebidas como texto).
CREATE TABLE IF NOT EXISTS demandas_treino (
    id INT PRIMARY KEY,
    demanda VARCHAR(200),
    area VARCHAR(100),
    status VARCHAR(50),
    data_abertura VARCHAR(10),
    prazo VARCHAR(10),
    percentual_conclusao INT
);

-- IMPORTAÇÃO: no DBeaver, importe o CSV com separador ';' para demandas_treino.
-- Não execute o próximo INSERT antes de confirmar que o CSV foi importado.
CREATE TABLE IF NOT EXISTS demandas_tratadas LIKE demandas_treino;

-- Cópia de trabalho, sem duplicar chaves já cadastradas.
INSERT IGNORE INTO demandas_tratadas
SELECT * FROM demandas_treino;

-- Conferir totais após a importação:
SELECT COUNT(*) AS registros_originais FROM demandas_treino;
SELECT COUNT(*) AS registros_tratados FROM demandas_tratadas;
