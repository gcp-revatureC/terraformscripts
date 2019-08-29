resource "google_app_engine_application" "dealer-upload-app" {
  name = "Dealer-Upload"
  project     = "${var.project}"
  location_id = "${var.location}"
}
resource "google_app_engine_application" "thirdparty-api" {
  name = "APIs"
  project     = "${var.project}"
  location_id = "${var.location}"
}
resource "google_app_engine_application" "analysis-app" {
  name = "Analytics-App"
  project     = "${var.project}"
  location_id = "${var.location}"
}
