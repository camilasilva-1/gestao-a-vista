-- GESTÃO À VISTA | 04 - Modelagem relacional (exemplos)
-- Use tabelas auxiliares; não altera as 60 demandas do dashboard.
USE gestao_a_vista;

CREATE TABLE IF NOT EXISTS areas_treino (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    nome_area VARCHAR(100) NOT NULL
);

-- Cadastra as quatro áreas somente se ainda não existirem.
INSERT INTO areas_treino (nome_area)
SELECT 'Tecnologia' WHERE NOT EXISTS (SELECT 1 FROM areas_treino WHERE nome_area = 'Tecnologia');
INSERT INTO areas_treino (nome_area)
SELECT 'Planejamento' WHERE NOT EXISTS (SELECT 1 FROM areas_treino WHERE nome_area = 'Planejamento');
INSERT INTO areas_treino (nome_area)
SELECT 'Administrativo' WHERE NOT EXISTS (SELECT 1 FROM areas_treino WHERE nome_area = 'Administrativo');
INSERT INTO areas_treino (nome_area)
SELECT 'Atendimento' WHERE NOT EXISTS (SELECT 1 FROM areas_treino WHERE nome_area = 'Atendimento');

-- Verifique duplicatas antes de criar UNIQUE
SELECT nome_area, COUNT(*) AS quantidade
FROM areas_treino
GROUP BY nome_area
HAVING COUNT(*) > 1;

-- Opcional, executar UMA ÚNICA VEZ após validar ausência de duplicatas:
-- ALTER TABLE areas_treino ADD CONSTRAINT uq_nome_area UNIQUE (nome_area);

CREATE TABLE IF NOT EXISTS demandas_relacionais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    demanda VARCHAR(200) NOT NULL,
    id_area INT,
    CONSTRAINT fk_area_demanda FOREIGN KEY (id_area)
      REFERENCES areas_treino(id_area)
);

-- Descubra os IDs reais antes de fazer INSERT na tabela relacionada
SELECT * FROM areas_treino;

-- Exemplo: ajuste os IDs de acordo com o resultado acima e execute uma vez:
-- INSERT INTO demandas_relacionais (demanda, id_area)
-- VALUES ('Atualizar sistema', 1), ('Criar relatório', 2);

-- JOIN: mostra demanda e nome da área correspondente
SELECT d.demanda, a.nome_area
FROM demandas_relacionais AS d
JOIN areas_treino AS a ON d.id_area = a.id_area;

-- LEFT JOIN: inclui também demandas sem área vinculada
SELECT d.demanda, a.nome_area
FROM demandas_relacionais AS d
LEFT JOIN areas_treino AS a ON d.id_area = a.id_area;
