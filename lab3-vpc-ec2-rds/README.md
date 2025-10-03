# 🧪 Lab 3: VPC + EC2 + RDS

## 🎯 Obiettivo
Progettare un'infrastruttura **sicura** e **scalabile** su AWS.

---

## 📋 Passaggi Principali

1. 🗄️ **Creare VPC** con subnet pubbliche e private  
2. 💻 **Lanciare EC2** Bastion Host nella subnet pubblica  
3. 🗄️ **Configurare RDS MySQL** nella subnet privata  
4. 🔐 **Setup Security Groups** e Network ACLs  
5. 🌐 **Configurare routing** e Internet Gateway  

---

## 🔗 File Terraform

- [lab3-vpc.tf](https://github.com/CarmeloFerraro/lab3-vpc-ec2-rds/blob/main/lab3-vpc.tf) – Creazione VPC e subnet  
- [lab3-ec2.tf](https://github.com/CarmeloFerraro/lab3-vpc-ec2-rds/blob/main/lab3-ec2.tf) – EC2 Bastion Host  
- [lab3-rds.tf](https://github.com/CarmeloFerraro/lab3-vpc-ec2-rds/blob/main/lab3-rds.tf) – RDS MySQL  
- [variables.tf](https://github.com/CarmeloFerraro/lab3-vpc-ec2-rds/blob/main/variables.tf) – Variabili Terraform  
- [outputs.tf](https://github.com/CarmeloFerraro/lab3-vpc-ec2-rds/blob/main/outputs.tf) – Output della configurazione  

---

## 🔒 Security Highlights

- ✅ **Bastion Host Pattern**: Accesso sicuro alle risorse private  
- ✅ **Database Isolation**: RDS completamente isolato da Internet  
- ✅ **Security Groups**: Controllo traffico a livello istanza  
- ✅ **Principle of Least Privilege**: Permessi minimi necessari  

---

## 📝 Note Chiave

- **VPC CIDR**: `10.0.0.0/16` per 65,536 indirizzi disponibili  
- **Multi-AZ Setup**: Subnet in AZ diverse per high availability  
- **Cost Optimization**: Utilizzo di t3.micro per testing  
- **Monitoring**: CloudWatch per metriche e VPC Flow Logs  

---

## 📌 Learning Focus

*Questo laboratorio consolida i concetti di **networking**, **sicurezza** e **database management** fondamentali per l'esame AWS Solutions Architect Associate.*

---

## 🖼️ Diagramma

```mermaid
flowchart TD
    subgraph AWS["AWS Cloud"]
        subgraph VPC["VPC 10.0.0.0/16"]
            subgraph PublicSubnet["Public Subnet 10.0.1.0/24"]
                EC2["EC2 BASTION HOST - SSH 22"]
            end
            subgraph PrivateSubnet["Private Subnet 10.0.2.0/24"]
                RDS["RDS MYSQL - DB 3306"]
            end
        end

        IGW["INTERNET GATEWAY"]
        RouteTablePublic["ROUTE TABLE PUB"]
        RouteTablePrivate["ROUTE TABLE PRIV"]
    end

    User["User"] -->|SSH| EC2
    EC2 -->|Query DB| RDS
    PublicSubnet --> RouteTablePublic
    PrivateSubnet --> RouteTablePrivate

    %% STILI
    style EC2 fill:#2c3e50,stroke:#fff,stroke-width:2px
    style RDS fill:#2c3e50,stroke:#fff,stroke-width:2px
    style IGW fill:#2c3e50,stroke:#fff,stroke-width:2px
    style RouteTablePublic fill:#2c3e50,stroke:#fff,stroke-width:2px
    style RouteTablePrivate fill:#2c3e50,stroke:#fff,stroke-width:2px
