
resource "google_sql_database_instance" "mydb" {
  name             = var.db_instance_name
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "mydb" {
  name     = var.db_name
  instance = google_sql_database_instance.mydb.name
}

resource "google_sql_user" "dbrw" {
  name     = var.db_user
  instance = google_sql_database_instance.mydb.name
  password = var.db_password
}
