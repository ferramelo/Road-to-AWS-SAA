terraform {
  backend "s3" {
    bucket         = "lab3-terraform-state211289420968" # Nome del bucket S3 che ospita il file di stato
    key            = "terraform.tfstate"                # Percorso/nome del file di stato all’interno del bucket
    region         = "eu-central-1"                     # Regione AWS del bucket S3 e della tabella DynamoDB
    dynamodb_table = "lab3-terraform-lock"              # Tabella DynamoDB utilizzata per il locking distribuito
  }
}

