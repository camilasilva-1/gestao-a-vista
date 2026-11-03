-- GESTÃO À VISTA | 02 - Padronização e validação
-- IMPORTANTE: executar somente na base fictícia de treinamento.
USE gestao_a_vista;

-- Diagnóstico das categorias de status
SELECT status, COUNT(*) AS quantidade
FROM demandas_tratadas
GROUP BY status
ORDER BY status;

-- Padronização das grafias identificadas no treinamento
UPDATE demandas_tratadas
SET status = 'Concluído'
WHERE status = 'concluido';

UPDATE demandas_tratadas
SET status = 'Em andamento'
WHERE status = 'Em Andamento';

-- Verificar registros sem área ou somente com espaços
SELECT id, demanda, area, status
FROM demandas_tratadas
WHERE area IS NULL OR TRIM(area) = '';

-- Verificar espaços antes/depois do nome de área
SELECT id, area
FROM demandas_tratadas
WHERE area IS NOT NULL AND area <> TRIM(area);

-- Conferir totais e distribuição de status
SELECT COUNT(*) AS total_demandas FROM demandas_tratadas;
SELECT status, COUNT(*) AS quantidade
FROM demandas_tratadas
GROUP BY status
ORDER BY status;

-- No Power Query: transformar datas para DATE, aplicar Text.Trim em area,
-- e criar area_relatorio = 'Não informada' quando area for nula ou vazia.
-- Essas operações do Power Query não modificam a tabela MySQL.
