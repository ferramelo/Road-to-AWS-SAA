# 🧪 Lab 1: High Availability & Disaster Recovery

## 🎯 Obiettivo
Configurare servizi **AWS** per garantire:
- Alta disponibilità (High Availability)
- Disaster Recovery

---

## 🛠️ Passaggi principali
1. 🗄️ Creare **RDS** in **Multi-AZ**  
2. 🔄 Configurare **failover automatico**  
3. 🌍 Creare **record DNS** con **Route 53** per il failover  
4. 📦 Testare **Cross-Region Replication** su **S3**

---

## 📝 Note personali
- ✅ Ho imparato a testare il **failover manuale**  
- 🌐 Importanza di configurare correttamente le **subnet private** e **public**  

---

📌 *Questo laboratorio è fondamentale per comprendere la resilienza e la continuità operativa in ambienti AWS.*

---

## 🖼️ Diagramma

```mermaid
flowchart TD
    subgraph AWS["AWS Cloud"]
        subgraph Region1["Region 1"]
            subgraph VPC1["VPC"]
                DB1[RDS PRIMARY - Multi-AZ]
                DB2[RDS STANDBY - Multi-AZ]
                S3A[(S3 BUCKET)]
            end
        end

        subgraph Region2["Region 2 - DR Site"]
            subgraph VPC2["VPC"]
                DB3[RDS REPLICA - Cross Region]
                S3B[(S3 REPLICA)]
            end
        end

        Route53[ROUTE 53 DNS FAILOVER]
    end

    User["User"] --> Route53
    Route53 --> DB1
    Route53 -.FAILOVER AUTOMATICO.-> DB2
    Route53 -.CROSS REGION FAILOVER.-> DB3

    S3A -->|Cross-Region Replication| S3B

    %% STILI
    style DB1 fill:#2c3e50,stroke:#fff,stroke-width:2px
    style DB2 fill:#2c3e50,stroke:#fff,stroke-width:2px
    style DB3 fill:#2c3e50,stroke:#fff,stroke-width:2px
    style S3A fill:#2c3e50,stroke:#fff,stroke-width:2px
    style S3B fill:#2c3e50,stroke:#fff,stroke-width:2px
    style Route53 fill:#2c3e50,stroke:#fff,stroke-width:2px
