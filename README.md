# Jornada SQL - Téo Me Why

Este repositório contém minha evolução e os projetos desenvolvidos durante o curso **"Aprenda SQL"**, ministrado pelo **Téo Calvo** no canal [Téo Me Why](https://www.youtube.com/@teomewhy).

O foco deste aprendizado não foi apenas "rodar comandos", mas sim desenvolver o **Raciocínio Analítico** para transformar dados brutos em informações de valor para o negócio (CRM, Marketing e Produto).

## Stack e Ferramentas
* **DBeaver**: Cliente SQL utilizado para conectar e explorar o banco.
* **SQLite / MySQL**: Banco de dados relacional utilizado.
* **Git & GitHub**: Versionamento dos scripts e queries.
* **Markdown**: Documentação dos projetos.

---

## O Que Eu Aprendi (Data Analytics Focus)

Diferente de cursos de "banco de dados" tradicionais, aqui o foco foi **SQL para Dados**:

### 1. Fundamentos Sólidos
* Estrutura de `SELECT`, `FROM`, `WHERE`.
* Operadores lógicos e de comparação (`AND`, `OR`, `LIKE`, `IN`).
* Tratamento de nulos (`COALESCE`).

### 2. Agregações e Análise Exploratória
* Como "esmagar" os dados com `GROUP BY`.
* Métricas estatísticas: `AVG`, `MIN`, `MAX`, `COUNT`, `SUM`.
* Filtros em agregações usando `HAVING`.

### 3. Manipulação de Tabelas (Joins)
* Entendimento profundo da granularidade (Chaves Primárias e Duplicidade).
* **LEFT JOIN** como a principal ferramenta para enriquecer bases sem perder dados da tabela principal.
* Diferenças práticas e estratégicas entre `INNER`, `LEFT`, `RIGHT` e `FULL JOIN`.

### 4. Funcionalidades Avançadas (O diferencial)
* **CTEs (Common Table Expressions):** Uso do `WITH` para criar queries organizadas, legíveis e modulares (evitando subqueries confusas).
* **Window Functions:** Criação de rankings, somas acumuladas e comparações entre linhas (`ROW_NUMBER`)
* **Datas e Strings:** Manipulação temporal (`DATE_DIFF`, extração de mês/ano) e tratamento de texto.
* **Views:** Criação de visões para facilitar o consumo dos dados.

---

## Projeto Final: Análise de CRM / RFV

O projeto de conclusão do curso consistiu na criação de um **Data Mart** focada no comportamento do cliente, simulando um cenário real de CRM.

**Objetivo:** Criar uma tabela única (One Big Table) que consolide a vida do cliente para alimentar dashboards ou modelos de Machine Learning.

### Desafios Resolvidos na Query Final:
1.  **Recência (Recency):** Calculei quantos dias se passaram desde a última compra/interação de cada cliente.
2.  **Frequência (Frequency):** Contagem de quantas vezes o cliente comprou/interagiu num período de tempo.
3.  **Valor (Monetary):** Ticket médio e total gasto pelo cliente.
4.  **Engenharia de Atributos (Feature Engineering):**
    * Criação de flags (ex: `cliente_churn`, `cliente_vip`).
    * Cálculo de "safra" (cohort) do cliente.

