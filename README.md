# 🏪 Sistema de Mercado

Aplicação Web de gerenciamento de produtos desenvolvida para a avaliação M2 da disciplina de Implementação Orientada a Objetos — Engenharia de Software 3B.

## 🚀 Tecnologias

- Java + Servlet
- JSP
- HTML & CSS puro
- MySQL
- Apache Tomcat 9

## 🏗️ Arquitetura

O projeto segue rigorosamente os padrões **MVC** e **DAO**:

| Camada | Arquivo | Responsabilidade |
|--------|---------|-----------------|
| Model | `Produto.java` | Representa a entidade com 12 atributos |
| View | `index.html`, `*.jsp` | Interface do usuário |
| Controller | `controle_produto.java` | Recebe requisições e coordena o fluxo |
| DAO | `ProdutoDAO.java` | Único ponto de acesso ao banco de dados |
| Util | `Conexao.java` | Fábrica de conexão centralizada |

## ⚙️ CRUD

- ✅ Cadastrar produto
- ✅ Deletar produto
- ✅ Atualizar produto
- ✅ Consultar por ID
- ✅ Consultar todos

## 🔒 Segurança

Todas as operações do DAO utilizam `PreparedStatement` com parâmetros `?`, neutralizando ataques de **SQL Injection** — incluindo tentativas com `' OR 1=1`, `DROP TABLE` e `INSERT` malicioso.

## 👥 Equipe

Desenvolvido por **Andy** e **Sabrina** — Turma 3B Engenharia de Software.
