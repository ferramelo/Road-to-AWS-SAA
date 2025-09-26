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
    

   Passaggi principali 
   
1. 🛠️ Creare **VPC** con **subnet pubbliche e private** 
2. 💻 Lanciare **EC2** nelle **subnet pubbliche** 
3. 🗄️ Creare **RDS** nelle **subnet private** 
4. 🔐 Configurare **Security Group** e **NACL** 

---

## 📝 Note personali 
-  ✅ La gestione corretta del **routing** e delle **ACL** è fondamentale per la sicurezza 🔒 

---

   📌 *Questo laboratorio consolida i concetti di networking e sicurezza nelle architetture AWS.*
