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
        Lambda["Lambda Function"]
        API["API Gateway"]
        DynamoDB["DynamoDB Table"]
    end

    User["User"] --> API
    API --> Lambda
    Lambda --> DynamoDB

