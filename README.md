# 🚲 AdventureWorks — Análise de Vendas e Compras

Projeto de Business Intelligence desenvolvido com o banco de dados AdventureWorks, disponibilizado pela Microsoft, para analisar as vendas e compras de uma empresa do setor de bicicletas.

O dashboard reúne duas páginas — **Financeiro** e **Compras** — com indicadores para acompanhar o desempenho comercial, a operação de compras e a qualidade dos recebimentos.

Além da preparação e modelagem dos dados, o projeto explora **Dataviz, storytelling e experiência do usuário**, com navegação entre páginas e um botão para alternar entre os modos **claro e escuro**. 🌗

## 🎯 Objetivo

Transformar dados transacionais em informações que ajudem a responder perguntas como:

- Qual é a receita e quantos pedidos foram realizados?
- Qual é o ticket médio e o volume de unidades vendidas?
- Como as vendas se distribuem por país e canal?
- Quais fornecedores concentram os valores comprados?
- Quanto do material recebido foi aceito ou rejeitado?
- Como os indicadores evoluíram em relação ao ano anterior?

## 📊 Página Financeiro

Visão do desempenho de vendas, com os seguintes indicadores e análises:

| Indicador ou análise | Finalidade |
| --- | --- |
| Receita | Acompanhar o valor das vendas |
| Pedidos de venda | Monitorar o volume de pedidos |
| Ticket médio | Analisar o valor médio por pedido |
| Unidades vendidas | Acompanhar o volume de produtos vendidos |
| Vendas por país | Comparar o desempenho entre países |
| Vendas por canal | Analisar a participação dos canais de venda |

## 📦 Página Compras

Visão da operação de compras e da qualidade dos recebimentos:

| Indicador ou análise | Finalidade |
| --- | --- |
| Fornecedores | Analisar a participação dos fornecedores nas compras |
| Valores comprados | Acompanhar o valor destinado às compras |
| Quantidades recebidas | Monitorar o volume de produtos recebidos |
| Quantidades aceitas | Acompanhar o volume aprovado no recebimento |
| Taxa de rejeição | Avaliar a proporção de itens rejeitados |
| Comparações com o ano anterior | Acompanhar a evolução dos indicadores ao longo do tempo |

A análise da taxa de rejeição inclui comparação com o ano anterior e variação percentual. Setas e cores ajudam a interpretar o resultado: a redução da rejeição é apresentada como uma melhoria, enquanto o aumento sinaliza um ponto de atenção.

## ⚙️ Desenvolvimento

### 1. Exploração da base

O AdventureWorks foi utilizado no **PostgreSQL**. A exploração da base envolveu entender as tabelas, suas chaves e os relacionamentos necessários para as análises de vendas e compras.

### 2. Preparação dos dados com SQL

As consultas SQL foram utilizadas para relacionar e estruturar os dados destinados ao dashboard.

O projeto também envolveu o trabalho com as camadas **Silver e Gold**, passando pela preparação dos dados e pela organização das informações para consumo analítico.

### 3. Conexão com o Power BI

A conexão entre o PostgreSQL e o Power BI foi realizada por **ODBC**, utilizando o banco `adventureworks` como origem dos dados.

### 4. Tratamento e modelagem

No Power BI, o trabalho envolveu tratamento de dados e construção de um modelo relacional para sustentar as análises.

Entre as tabelas utilizadas no modelo estão:

| Tabela | Papel |
| --- | --- |
| `fVendas` | Tabela fato utilizada nas análises de vendas |
| `fCompras` | Tabela fato utilizada nas análises de compras |
| `dCalendário` | Dimensão de datas criada em M, utilizada nas análises temporais |

### 5. Criação das medidas

As medidas foram desenvolvidas em **DAX** para calcular os indicadores apresentados no dashboard e realizar comparações temporais, incluindo resultados do ano anterior e variações percentuais.

### 6. Construção da interface

A apresentação visual foi desenvolvida com atenção à hierarquia dos indicadores, organização das informações, cores e navegação.

O **Canva** foi utilizado na composição visual, enquanto o Power BI reuniu os elementos de análise e interação do relatório.

## 🌗 Dataviz e experiência do usuário

O dashboard permite alternar entre os modos **claro e escuro nas duas páginas**, conforme a preferência de quem utiliza o relatório.

Os principais aspectos trabalhados na interface foram:

- Organização dos indicadores para facilitar a leitura.
- Hierarquia visual para destacar as informações principais.
- Navegação entre Financeiro e Compras.
- Uso de cores e setas para comunicar variações.
- Formatação dos valores para facilitar a interpretação.
- Consistência visual entre páginas e temas.

## 🛠️ Ferramentas e tecnologias

| Ferramenta | Aplicação no projeto |
| --- | --- |
| PostgreSQL | Armazenamento e consulta da base AdventureWorks |
| SQL | Relacionamento, preparação e estruturação dos dados |
| ODBC | Conexão do PostgreSQL com o Power BI |
| Power BI | Modelagem, visualização e construção do dashboard |
| Power Query / M | Tratamento de dados e criação da dimensão calendário |
| DAX | Cálculo de indicadores e comparações temporais |
| Canva | Composição visual do dashboard |

## 🧠 Aprendizados

O projeto permitiu trabalhar diferentes etapas de uma solução de BI: exploração de uma base relacional, preparação de dados com SQL, atuação nas camadas Silver e Gold, modelagem no Power BI e desenvolvimento de medidas DAX.

Também foi uma oportunidade de aplicar Dataviz e UX para apresentar informações de vendas e compras com clareza, conectando a construção técnica à interpretação dos resultados.

## 👤 Autor

**Lucas Krebs**  
Analista de Dados | Power BI | SQL | Business Intelligence

[LinkedIn](https://www.linkedin.com/in/lucaskrebs05) · [GitHub](https://github.com/Lucaskrebs0512)
