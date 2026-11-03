-- GESTÃO À VISTA | 05 - Exemplos independentes de tipos e restrições
USE gestao_a_vista;

CREATE TABLE IF NOT EXISTS exemplo_tipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    orcamento DECIMAL(10,2),
    data_entrega DATE,
    percentual INT CHECK (percentual BETWEEN 0 AND 100),
    status ENUM('Pendente', 'Em andamento', 'Concluído')
);

-- Exemplo de cadastro: executar uma vez se desejar testar.
-- INSERT INTO exemplo_tipos
-- (descricao, orcamento, data_entrega, percentual, status)
-- VALUES ('Relatório mensal', 1500.75, '2026-11-05', 75, 'Pendente');

SELECT * FROM exemplo_tipos;
