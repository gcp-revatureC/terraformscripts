resource "google_app_engine_application" "dealer-upload-app" {
  name = "Dealer-Upload"
  project     = "${google_project.my_project.project_id}"
  location_id = "${var.location}"
}
resource "google_app_engine_application" "3rdparty-api" {
  name = "APIs"
  project     = "${google_project.my_project.project_id}"
  location_id = "${var.location}"
}
resource "google_app_engine_application" "analysis-app" {
  name = "Analytics-App"
  project     = "${google_project.my_project.project_id}"
  location_id = "${var.location}"
}
