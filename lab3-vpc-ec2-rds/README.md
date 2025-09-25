# 🧪 Lab 3: VPC + EC2 + RDS

## 🎯 Obiettivo
Progettare un’infrastruttura **sicura** e **scalabile** su AWS.

---

## 🖼️ Diagramma Infrastruttura Dettagliato
```mermaid
flowchart TD
    subgraph VPC["Lab3-VPC (10.0.0.0/16)"]
        subgraph Public1["Subnet Pubblica 1 (10.0.1.0/24) - AZ1"]
            EC2_1[💻 EC2 - Web Server 1]
        end
        subgraph Public2["Subnet Pubblica 2 (10.0.2.0/24) - AZ2"]
            EC2_2[💻 EC2 - Web Server 2]
        end
        subgraph Private1["Subnet Privata 1 (10.0.3.0/24) - AZ1"]
            RDS_1[🗄️ RDS - DB 1]
        end
        subgraph Private2["Subnet Privata 2 (10.0.4.0/24) - AZ2"]
            RDS_2[🗄️ RDS - DB 2]
        end
        IGW[🌐 Internet Gateway]
    end

    EC2_1 -->|HTTP/SSH| IGW
    EC2_2 -->|HTTP/SSH| IGW
    EC2_1 -->|MySQL/Postgres| RDS_1
    EC2_2 -->|MySQL/Postgres| RDS_2
