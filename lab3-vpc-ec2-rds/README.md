# 🧪 Lab 3: VPC + EC2 + RDS

## 🎯 Obiettivo
Progettare un’infrastruttura **sicura** e **scalabile** su AWS.

---

## 🖼️ Diagramma Infrastruttura Dettagliato
```mermaid
flowchart TD
    subgraph VPC["VPC: 10.0.0.0/16"]
        subgraph PublicSubnet["Public Subnet: 10.0.1.0/24"]
            EC2["EC2 Bastion Host\nPorta SSH: 22"]
        end
        subgraph PrivateSubnet["Private Subnet: 10.0.2.0/24"]
            RDS["RDS MySQL\nPorta DB: 3306"]
        end
    end

    IGW["Internet Gateway"]
    RouteTablePublic["Route Table Pub\n0.0.0.0/0 → IGW"]
    RouteTablePrivate["Route Table Priv\nIsolata da Internet"]

    EC2 -->|Connessione SSH| IGW
    EC2 -->|Connessione DB| RDS
    PublicSubnet --> RouteTablePublic
    PrivateSubnet --> RouteTablePrivate
