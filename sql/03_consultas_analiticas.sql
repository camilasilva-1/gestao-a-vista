-- GESTÃO À VISTA | 03 - Consultas para exploração e indicadores
-- Todos os comandos deste arquivo são somente leitura.
USE gestao_a_vista;

-- Visão geral
SELECT * FROM demandas_tratadas;
SELECT COUNT(*) AS total_demandas FROM demandas_tratadas;

-- Demandas por situação
SELECT status, COUNT(*) AS quantidade
FROM demandas_tratadas
GROUP BY status
ORDER BY quantidade DESC;

-- Demandas atrasadas de uma área
SELECT id, demanda, area, status
FROM demandas_tratadas
WHERE area = 'Planejamento' AND status = 'Atrasado';

-- Demandas em duas situações possíveis
SELECT id, demanda, status
FROM demandas_tratadas
WHERE status = 'Concluído' OR status = 'Em andamento';

-- Prazos dentro de intervalo (compatível com texto AAAA-MM-DD padronizado)
SELECT id, demanda, prazo
FROM demandas_tratadas
WHERE prazo BETWEEN '2026-10-10' AND '2026-10-25';

-- Areas nao informadas
SELECT id, demanda, area
FROM demandas_tratadas
WHERE area IS NULL OR TRIM(area) = '';

-- Contagem por área, padronizada apenas para a consulta
SELECT
    CASE WHEN area IS NULL OR TRIM(area) = '' THEN 'Não informada'
         ELSE TRIM(area) END AS area_relatorio,
    COUNT(*) AS quantidade
FROM demandas_tratadas
GROUP BY area_relatorio
ORDER BY quantidade DESC;

-- Média do percentual de conclusão por área
SELECT
    CASE WHEN area IS NULL OR TRIM(area) = '' THEN 'Não informada'
         ELSE TRIM(area) END AS area_relatorio,
    ROUND(AVG(percentual_conclusao), 2) AS media_conclusao
FROM demandas_tratadas
GROUP BY area_relatorio
ORDER BY media_conclusao DESC;
