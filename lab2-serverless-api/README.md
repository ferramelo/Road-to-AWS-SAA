# 🧪 Lab 2: Serverless API

## 🎯 Obiettivo
Creare un’API serverless utilizzando:  
- ⚡ AWS Lambda  
- 🌐 API Gateway  
- 🗄️ DynamoDB  

---

## 🛠️ Passaggi principali

1. ⚡ **Creare funzione Lambda**  
2. 🌐 **Configurare API Gateway**  
3. 🗄️ **Creare tabella DynamoDB** e collegarla alla Lambda  
4. 🧪 **Testare endpoint API**  

---

## 📝 Note personali

- ✅ Ottima esercitazione per comprendere l’integrazione serverless  
- 🔑 Importanza della gestione corretta dei permessi IAM  

---

## 📌 Learning Focus

*Questo laboratorio mostra come costruire architetture scalabili senza server dedicati.*

---

## 🖼️ Diagramma

```mermaid

flowchart TD
    subgraph AWS["AWS Cloud"]
        Lambda["LAMBDA FUNCTION"]
        API["API GATEWAY"]
        DynamoDB["DYNAMODB TABLE"]
    end

    User["User"] --> API
    API --> Lambda
    Lambda --> DynamoDB

    %% STILI
    style Lambda fill:#f9f,stroke:#333,stroke-width:2px
    style API fill:#ff9,stroke:#333,stroke-width:2px
    style DynamoDB fill:#bbf,stroke:#333,stroke-width:2px

