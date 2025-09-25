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


## 🛠️ Passaggi principali
1. 🛠️ Creare **VPC** con **subnet pubbliche e private**  
2. 💻 Lanciare **EC2** nelle **subnet pubbliche**  
3. 🗄️ Creare **RDS** nelle **subnet private**  
4. 🔐 Configurare **Security Group** e **NACL**

---

## 📝 Note personali
- ✅ La gestione corretta del **routing** e delle **ACL** è fondamentale per la sicurezza 🔒  

---

📌 *Questo laboratorio consolida i concetti di networking e sicurezza nelle architetture AWS.*
