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
    subgraph AWS["🌐 AWS Cloud"]
        subgraph Region1["Region 1"]
            subgraph VPC1["VPC"]
                DB1[🗄️ RDS Primary (Multi-AZ)]
                DB2[🗄️ RDS Standby (Multi-AZ)]
                S3A[(📦 S3 Bucket)]
            end
        end

        subgraph Region2["Region 2 (DR Site)"]
            subgraph VPC2["VPC"]
                DB3[🗄️ RDS Replica (Cross-Region)]
                S3B[(📦 S3 Replica)]
            end
        end

        Route53[🌍 Route 53 DNS Failover]
    end

    User[👤 Utente] --> Route53
    Route53 --> DB1
    Route53 -.Failover Automatico.-> DB2
    Route53 -.Cross-Region Failover.-> DB3

    S3A --> S3B

