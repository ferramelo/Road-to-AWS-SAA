# 🧪 Lab 4: S3 Cross-Region Replication

## 🎯 Obiettivo
Garantire disaster recovery replicando i dati tra più regioni AWS.

---

## 🛠️ Passaggi principali

1. 📦 **Creare bucket S3 primario e secondario**  
2. 🔄 **Configurare Cross-Region Replication (CRR)**  
3. 🧪 **Testare la replicazione** con upload di file  

---

## 📝 Note personali

- ✅ La gestione corretta dei permessi IAM 🔑 è cruciale per la replicazione  

---

## 📌 Learning Focus

*Questo laboratorio evidenzia l’importanza della ridondanza geografica per la continuità operativa.*

---

## 🖼️ Diagramma

```mermaid
flowchart TD
    subgraph AWS["AWS Cloud"]
        S3Primary["S3 BUCKET PRIMARIO"]
        S3Replica["S3 BUCKET REPLICA"]
    end

    User["User"] --> S3Primary
    S3Primary -->|Cross-Region Replication| S3Replica

    %% STILI
    style S3Primary fill:#2c3e50,stroke:#fff,stroke-width:2px
    style S3Replica fill:#2c3e50,stroke:#fff,stroke-width:2px
