# Documento de Arquitetura – We Go Gym

## 1. Visão Geral
O **We Go Gym** é uma plataforma web para gerenciamento de treinos e acompanhamento físico. O sistema adota uma arquitetura baseada em microsserviços, separando responsabilidades de interface, regra de negócio e autenticação, garantindo escalabilidade e desacoplamento.

---

## 2. Objetivos do Sistema
- Permitir que treinadores(admins) cadastrem e gerenciem  os exercícios criados por eles  
- Permitir que alunos  acessem informações de seus treinos, adicionem exercíicos a eles e observem sua evolução.  
- Garantir persistência dos dados, desempenho e facilidade de manutenção.  

---

## 3. Requisitos de Arquitetura

### Funcionais (derivados do backlog)
| ID   | Requisito                                    | Usuário       |
|------|---------------------------------------------|---------------|
| US01 | Cadastro e edição de exercícios                          | Treinador     |
| US02 | Remoção de exercícios                            | Treinador     |
| US03 | Edição de dados de alunos                    | Alunos    |
| US04 | Cadastro de Treinos                          | Alunos     |
| US05 | Inclusão de exercícios aos treinos               |Alunos     |
| US06 | Calcular seu IMC               | Aluno
| US07 | Persistência de dados                        | Administrador |
| US08 |Busca e filtragem de treinos por nome ou categoria                       | Alunos |
| US09 | Visualização de indicadores de resumo (Dashboard)                       | Alunos |
| US10 | Validação de login e autenticação            | Todos         |

### Não-funcionais
- Persistência em banco de dados relacional MySQL.  
- Sistema modular e escalável.  
- Testes  com Pytest para backend.  
- Testes com Pytest + Selenium para o frontend
- Infraestrutura baseada em Docker para containerização de frontend, backend e banco de dados.  
- Frontend responsivo e acessível, desenvolvido em React + Nextjs.  


---

## 4. Diagrama de Arquitetura de Alto Nível

![Diagrama de Arquitetura de Alto Nível](assets/DiagramaAltoNivel.PNG)

> **Descrição**:  
- A interface web (frontend), faz chamadas REST para utilizar os serviços do backend.  
- O backend utiliza o SQLAlchemy como camada de abstração para salvar e consultar dados no MySQL.  
- Há testes que validam o funcionamento das rotas da API e o funcionamento do frontend.  
- Todo o ambiente do sistema é executado em containers Docker.  

---

## 5. Componentes do Sistema

| Componente       | Tecnologia             | Responsabilidade                                           |
|-----------------|----------------------|------------------------------------------------------------|
| Backend         | FastAPI + SQLAlchemy | Lógica de negócio, APIs REST, validação e persistência    |
| Banco de Dados  | MySQL                | Persistência de alunos,treinos, exercícios e IMCs            |
| Frontend         | React   + Nextjs         | Interface do usuário, consultas, filtros e formulários        |
| Testes          | Pytest   + Selenium            | Testes automatizados do frontend e do backend           |
| Infraestrutura  | Docker               | Containerização do frontend, backend, banco de dados e api de autenticação              |

---

## 6.  Principais Fluxos de Aplicação
Abaixo segue imagens de alguns dos fluxos de uso  considerados mais importantes para a aplicação.

**Acesso a Aplicação**  
![Acesso a Aplicação](assets/AcessoUsuario.png)

**Cadastro de Aluno**  
![Cadastro de Aluno](assets/CadastroAluno.PNG)

**Cadastro de Treinos**  
![Cadastro de Treinos](assets/CriarTreino.PNG)

**Visualisar Treinos**  
![Visualizar Treinos](assets/VerTreinos.PNG)

---

## 7. Decisões Arquiteturais

| Escolha Tecnológica        | Motivo                                                                 |
|----------------------------|------------------------------------------------------------------------|
| Backend em FastAPI         | Rápido, integração nativa com Python e suporte a testes automatizados |
| SQLAlchemy ORM             | Simplifica o mapeamento entre objetos Python e banco de dados         |
| MySQL                      | Gerenciamento de dados relacionais e execução de consultas complexas  |
| Docker                     | Automatiza a criação de ambientes consistentes, facilita deploy e escalabilidade |
| Testes com Pytest e Selenium | Pytest para lógica de backend e Selenium para testes de interface e integração |
| Frontend em React + Nextjs      | Criação de interfaces dinâmicas, reativas e componíveis               |



---

## 9. Histórico de Versão

|Versão|Data|Descrição|
|:----:|----|---------|
|`1.0`| 25/09/2025 | Criação do Artefato |
|`2.0`| 24/11/2025 | Atualização do Artefato |
