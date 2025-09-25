# 🧪 Lab 3: VPC + EC2 + RDS

## 🎯 Obiettivo
Progettare un’infrastruttura **sicura** e **scalabile** su AWS.

---

## 🖼️ Diagramma Infrastruttura
```mermaid
flowchart TD
    subgraph VPC["Lab3-VPC (10.0.0.0/16)"]
        subgraph Public["Subnet Pubblica"]
            EC2_1[💻 EC2 - Web Server 1]
        end
        subgraph Private["Subnet Privata"]
            RDS[🗄️ RDS - Database]
        end
        IGW[🌐 Internet Gateway]
    end

    EC2_1 -->|HTTP/SSH| IGW
    EC2_1 -->|MySQL/Postgres| RDS
---

