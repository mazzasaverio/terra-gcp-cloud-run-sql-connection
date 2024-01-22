resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.gcp_network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.internet_access_source_ranges
}

resource "google_compute_firewall" "internal_traffic" {
  name    = "allow-internal-traffic"
  network = var.gcp_network_name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [var.internal_traffic_source_range]
}

resource "google_compute_firewall" "internet_access" {
  name    = "allow-internet-access"
  network = var.gcp_network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = var.internet_access_source_ranges
}

resource "google_compute_firewall" "cloud_sql_proxy" {
  name    = "allow-cloud-sql-proxy"
  network = var.gcp_network_name

  allow {
    protocol = "tcp"
    ports    = ["5433", "3307", "5432"]
  }

  source_ranges = [var.cloud_sql_proxy_source_range]
  target_tags   = ["cloud-sql-proxy"]
}
