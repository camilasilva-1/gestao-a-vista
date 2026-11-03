# Power BI — Gestão à Vista

## Visão geral

O painel **Gestão à Vista** apresenta indicadores gerenciais de uma base demonstrativa com **60 demandas fictícias**. A análise foi criada no **Power BI Desktop**, com preparação dos dados no **Power Query** e origem em uma base **MySQL**.

## Visuais do dashboard

| Visual | Finalidade | Resultado validado |
| --- | --- | --- |
| Cartão — Total de demandas | Volume geral da base | **60** |
| Cartão — Demandas atrasadas | Quantidade no status `Atrasado` | **12** |
| Cartão — Demandas concluídas | Quantidade no status `Concluído` | **16** |
| Barras — Demandas por status | Distribuição por situação | 17 em andamento, 16 concluídas, 15 pendentes, 12 atrasadas |
| Barras — Demandas por área responsável | Comparar volume entre as áreas | Inclui categoria **Não informada** |
| Barras — Média de conclusão por área (%) | Comparar a média de `percentual_conclusao` (0 a 100) | Agregação de **média**, não soma nem % do total geral |

## Tratamento de dados no Power Query

1. Converter `data_abertura` e `prazo` em tipo **Data**.
2. Aplicar **Texto Aparado (Text.Trim)** na coluna `area` para eliminar espaços extras.
3. Criar a coluna condicional `area_relatorio`: áreas nulas ou vazias são apresentadas como **Não informada**; os demais valores preservam a área existente.
4. Conferir a qualidade das colunas, os valores vazios e o total de 60 registros.
5. Aplicar as etapas ao modelo do Power BI. No modo de importação usado no projeto, essas transformações **não alteram diretamente a tabela MySQL**.

## Interatividade

Clicar em uma barra pode filtrar ou destacar os demais visuais. Os cartões mostraram valores temporariamente diferentes durante uma seleção; ao limpar a seleção, retornaram às contagens validadas.

## Arquivos

- `Gestao_a_Vista.pbit`: template exportado do Power BI Desktop. **Não contém os dados importados**.
- `Gestao_a_Vista.pbix`: arquivo de desenvolvimento local, que não foi incluído aqui.
- `dashboard_gestao_a_vista.png`: captura do painel, a anexar em `imagens/`.
- `dados/gestao_a_vista_dados.csv`: base fictícia, a anexar para reprodução.

## Como abrir o template

1. Instale o Power BI Desktop.
2. Abra o arquivo `.pbit`.
3. Informe ou ajuste a conexão local com o servidor MySQL usado no exercício.
4. Importe a tabela `gestao_a_vista.demandas_tratadas`.
5. Confira a atualização dos dados e os indicadores.

**Nota:** os números exibidos nas capturas refletem a base fictícia utilizada no exercício. Uma base diferente gerará indicadores diferentes.

## Próximos aprimoramentos possíveis

- Acrescentar segmentações de dados por status e área.
- Adicionar rótulos de dados às barras e melhorar os nomes dos eixos.
- Documentar a atualização dos dados e as dependências locais.
- Testar a abertura do template em outra instalação.
