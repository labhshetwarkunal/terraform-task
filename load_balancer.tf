resource "google_compute_global_address" "default" {
  name = "${var.service_name}-ip"
}

resource "google_compute_url_map" "default" {
  name            = "${var.service_name}-url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name   = "${var.service_name}-http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "${var.service_name}-forwarding-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
  ip_address = google_compute_global_address.default.address
}

resource "google_compute_backend_service" "default" {
  name                  = "${var.service_name}-backend-service"
  port_name             = "http"
  protocol              = "HTTP"
  timeout_sec           = 10

  
}


