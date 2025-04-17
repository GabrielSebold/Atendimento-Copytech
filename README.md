# 📄 Sistema de Gerenciamento de Filas com Descritores Copytech - Unidavi (Pascal)

## 👨‍💻 Alunos

- Gabriel Sebold  
- Leonardo Casa Nova

---

## 🏢 Descrição do Projeto

Este projeto simula o gerenciamento de atendimento da empresa **Copytech**, que oferece serviços de impressão em três categorias:

- Mono (preto e branco)
- Color (colorido)
- Plotter (grandes formatos)

O sistema utiliza **filas com descritores** para organizar os atendimentos, controlando a entrada e saída de clientes e informando estatísticas detalhadas.

---

## 📌 Regras do Sistema

### Tipos de Filas

| Tipo     | Capacidade Máxima |
|----------|-------------------|
| Mono     | 10 clientes       |
| Colorida | 5 clientes        |
| Plotter  | 3 clientes        |

---

### Funcionalidades

- ✅ Inserção de clientes na fila
- 🧾 Atendimento (remoção da fila)
- 🔍 Consulta do estado da fila
- 📊 Exibição de estatísticas:
  - Clientes **entrantes**
  - Clientes **atendidos**
  - Clientes **rejeitados** (caso a fila esteja cheia)

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Pascal
- **Paradigma:** Programação estruturada
- **IDE utilizada:** Pascalzim

---

## 📂 Organização do Código

- Uso de **procedures** e **funções** para modularização
- Filas implementadas com **descritores**, contendo:
  - Contador de elementos
  - Contadores de entradas, atendimentos e rejeições

---

## 🖥️ Execução

O sistema é interativo e baseado em menus. Ao executar o programa, você poderá escolher:

1. Inserir clientes nas filas
2. Atender clientes
3. Consultar o estado de cada fila
4. Encerrar o sistema

Cada operação exibe mensagens de confirmação e informações atualizadas da fila.

---

## 📝 Observações

Este é um projeto didático desenvolvido como parte da disciplina de **Estrutura de Dados** na **Unidavi**. O objetivo é treinar o uso de estruturas de dados, em especial **filas com descritores**, utilizando a **IDE Pascalzim**.

---
