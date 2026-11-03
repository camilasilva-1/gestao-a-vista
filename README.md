# Gestão à Vista — Dashboard de Acompanhamento de Demandas

Projeto **educacional e demonstrativo**, desenvolvido para praticar organização, tratamento e análise de dados com **MySQL, DBeaver, Power Query e Power BI**. Os 60 registros utilizados no estudo são fictícios.

## Objetivo
Simular um fluxo de análise de demandas: carregar uma base, diagnosticar dados inconsistentes, padronizar categorias, construir consultas SQL e apresentar indicadores gerenciais.

## Indicadores da base de treinamento
| Indicador | Quantidade |
|---|---:|
| Demandas | 60 |
| Atrasadas | 12 |
| Concluídas | 16 |
| Em andamento | 17 |
| Pendentes | 15 |

O relatório também apresenta demandas por área responsável e média do percentual de conclusão por área.

## Ferramentas
- **MySQL e DBeaver:** criação de tabelas, consultas, filtros, agregações e relacionamento de dados.
- **Power Query:** conversão de datas, remoção de espaços e tratamento de campos sem área informada.
- **Power BI:** cartões de indicadores e gráficos de acompanhamento.

## Visualização do dashboard

O painel foi desenvolvido em **Power BI Desktop**, com dados preparados no **Power Query**.

**Indicadores principais:** 60 demandas, 12 atrasadas e 16 concluídas. Os gráficos apresentam a distribuição por status, por área responsável e a média de conclusão por área.

**Captura do dashboard:** o arquivo será incluído na pasta `imagens/`.

**Arquivo do Power BI:** o modelo `Gestao_a_Vista.pbit` será incluído na pasta `powerbi/`. Diferentemente de um `.pbix`, o `.pbit` preserva a estrutura e as consultas, mas não os registros importados.

Leia a [documentação do Power BI](docs/POWER_BI.md) para entender indicadores, etapas do Power Query, interações e reprodução do relatório.

## Estrutura

- `sql/`: consultas e exemplos de modelagem.
- `docs/POWER_BI.md`: documentação dos indicadores, visuais e transformações.
- `dados/`: base CSV fictícia (pendente de publicação).
- `powerbi/`: modelo `.pbit` (pendente de publicação).
- `imagens/`: captura do painel (pendente de publicação).

## Tratamento
- Status padronizados: `concluido` → `Concluído`, `Em Andamento` → `Em andamento`.
- Espaços extras removidos de `area` com `Text.Trim`.
- Criação de `area_relatorio` para identificar ausências como **Não informada**.
- Registros incompletos preservados, sem inventar a área responsável.
- Percentuais de conclusão armazenados como números de 0 a 100.

## Como reproduzir
1. Crie uma base MySQL de treinamento denominada `gestao_a_vista`.
2. Importe o CSV fictício para `demandas_treino` e faça uma cópia para `demandas_tratadas`.
3. Execute os scripts de `sql/` de forma seletiva. Leia os comentários antes de comandos que alterem dados.
4. Abra o modelo `.pbit` no Power BI Desktop (quando publicado) e ajuste a conexão para seu MySQL local. O template não transporta os dados.

## Observações e limites
Os números acima são os resultados validados na base didática. A captura do painel e o template serão anexados separadamente; este repositório não contém dados institucionais. A conexão com MySQL usa o ambiente local do autor e pode precisar ser reconfigurada em outro computador.

**Segurança:** não publicar senhas, credenciais, `.env` ou dados reais de serviços públicos.
