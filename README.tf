# Define el proveedor de Google Cloud
provider "google" {
  project = "corp-dev-infra-test"
  region  = "us-east4" # Reemplaza con tu región deseada
}

# Define la instancia Cloud SQL
resource "google_sql_database_instance" "my_instance" {
  name = "my-cloud-sql-instance"
  database_version = "POSTGRES_14" # Reemplaza con la versión deseada (MySQL o PostgreSQL)
  region  = google.region.self  # Hereda la región del provider

  # Configuración de la base de datos
  settings {
    tier = "db-f1-micro" # Nivel de la máquina
    storage_auto_grow = 10  # GB de almacenamiento automático
    activation_policy = "ALWAYS"
  }

  # Credenciales y conexión
  root_password = "your_strong_password" # Reemplaza con una contraseña segura

  # Conexiones permitidas (opcional)
  # ip_configuration {
  #   allowed_network = "10.0.0.0/16" # Restrict acceso a una red específica
  # }
}
