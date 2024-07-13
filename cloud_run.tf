resource "google_cloud_run_service" "my-svc" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image

        env {
          name  = "DB_INSTANCE_CONNECTION_NAME"
          value = google_sql_database_instance.mydb.connection_name
        }
        env {
          name  = "DB_NAME"
          value = var.db_name
        }
        env {
          name  = "DB_USER"
          value = var.db_user
        }
        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_cloud_run_service_iam_member" "clruser" {
  service = google_cloud_run_service.my-svc.name
  location = google_cloud_run_service.my-svc.location
  role    = "roles/run.invoker"
  member  = "allUsers"
}
