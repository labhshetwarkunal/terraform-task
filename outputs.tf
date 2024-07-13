output "db_instance_name" {
  value = google_sql_database_instance.mydb.name
}

output "db_connection_name" {
  value = google_sql_database_instance.mydb.connection_name
}

output "cloud_run_url" {
  value = google_cloud_run_service.my-svc.status[0].url
}

output "load_balancer_ip" {
  value = google_compute_global_address.default.address
}
