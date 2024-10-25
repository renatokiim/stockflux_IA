# StockFlux API

Esta é a API da aplicação web do StockFlux, utilizada para gerenciar o dashboard. 

A API é desenvolvida em Flask para manipular e exibir os dados.

## Web

[https://github.com/Goncalvs98/stock_flux.git](https://github.com/Goncalvs98/stock_flux.git)

---

# ChatBot

Este projeto implementa um chatbot capaz de responder perguntas relacionadas ao estoque de medicamentos utilizando uma rede neural e uma API de consulta de medicamentos. O chatbot usa técnicas de Processamento de Linguagem Natural (PLN) e integra-se a uma API REST para obter informações detalhadas sobre medicamentos.

## Funcionalidades

- **Reconhecimento de Intenção**: O chatbot utiliza um classificador de intenções treinado para reconhecer perguntas sobre o estoque de medicamentos.
- **Consulta de Estoque**: Faz consultas em uma API REST para verificar o estoque de medicamentos e retorna informações como quantidade disponível, data de atualização e local do estoque.
- **Processamento de Linguagem Natural (PLN)**: Usa `nltk` para processamento de textos e `transformers` para identificar intenções com modelos pré-treinados.
- **Respostas Inteligentes**: Responde de forma inteligente a consultas sobre medicamentos e outras perguntas relacionadas ao contexto.

## Tecnologias Utilizadas

- **Python 3.8+**
- **TensorFlow/Keras**: Para o modelo de rede neural de classificação de intenções.
- **nltk**: Para tokenização e lematização de frases.
- **transformers**: Para classificação de intenção zero-shot usando o modelo `facebook/bart-large-mnli`.
- **Flask**: Backend que fornece a API REST para a consulta de medicamentos.
- **pickle**: Para carregar o modelo pré-treinado de classificação de intenções.
- **JSON**: Para armazenar as intenções e os dados dos medicamentos.

## Estrutura do Projeto

```
.
├── chatbot.py           # Código principal do chatbot
├── intents.json         # Arquivo JSON com as intenções e respostas
├── medicamentos.json    # Arquivo JSON com informações dos medicamentos
├── palavras.pkl         # Arquivo pickle contendo as palavras processadas
├── classes.pkl          # Arquivo pickle contendo as classes de intenções
├── chatbotmodel.h5      # Modelo treinado em Keras para classificar intenções
├── requirements.txt     # Bibliotecas e dependências do projeto
└── README.md            # Documentação do projeto
```

## Como Executar o Projeto

### Pré-requisitos

- **Python 3.8+** instalado.
- Instalando as dependências:
  ```bash
  pip install -r requirements.txt
  ```

### Rodando o Chatbot

1. **Clone o Repositório**:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```
   
2. **Executando o Chatbot**:
   Execute o arquivo `chatbot.py` para iniciar o chatbot:
   ```bash
   python chatbot.py
   ```

3. **API REST**:
   Certifique-se de que a API REST para consulta de medicamentos esteja rodando localmente na porta `5000`. O chatbot faz requisições para:
   - `GET /api/medicamentos/id?nome_medicamento=<nome>`: Para obter o ID do medicamento.
   - `GET /api/estoque?medicamento_id=<id>`: Para obter o estoque do medicamento.

   **Exemplo de API**:
   ```bash
   curl http://localhost:5000/api/medicamentos/id?nome_medicamento=Amoxicilina
   ```

### Estrutura dos Arquivos JSON

- **`intents.json`**:
  Armazena as intenções do chatbot e as respostas associadas. Exemplo:
  ```json
  {
    "intents": [
      {
        "tag": "saudacao",
        "patterns": ["Oi", "Olá", "Tudo bem?"],
        "responses": ["Olá, como posso ajudar?", "Oi, tudo bem?"]
      }
    ]
  }
  ```

- **`medicamentos.json`**:
  Contém informações de medicamentos disponíveis para consulta. Exemplo:
  ```json
  {
    "medicamentos": [
      {
        "id": 1,
        "nome": "Paracetamol",
        "estoque": 100
      }
    ]
  }
  ```

## Exemplo de Uso

Após iniciar o chatbot, ele estará pronto para responder às perguntas do usuário.

**Exemplo**:
```bash
Usuário: Qual é o estoque de Paracetamol?
ChatBot: Há 100 unidades de Paracetamol disponíveis no estoque.
```

## Modelo de Rede Neural

O modelo de rede neural foi treinado usando Keras para classificar intenções com base em padrões de entrada do usuário. Ele utiliza a função `bag_of_words()` para transformar as frases em vetores binários e faz a previsão da classe de intenção usando `predict_class()`.

## Contribuição

Se desejar contribuir com melhorias no projeto, siga os seguintes passos:

1. Faça um fork do projeto.
2. Crie uma branch com suas modificações: `git checkout -b minha-modificacao`.
3. Faça commit das suas mudanças: `git commit -m 'Minha modificação'`.
4. Envie para o repositório remoto: `git push origin minha-modificacao`.
5. Abra um pull request.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Esse `README.md` cobre todos os aspectos principais do projeto, desde como configurá-lo e executá-lo até detalhes sobre a estrutura e as funcionalidades do chatbot. Se houver algum detalhe extra que queira adicionar, como informações específicas sobre a API ou links de referências, fique à vontade para personalizá-lo!
