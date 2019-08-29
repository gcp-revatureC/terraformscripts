resource "google_pubsub_topic" "car-info" {
  name = "car-info"
}

resource "google_cloudiot_registry" "default-registry" {
  name = "default-registry"

  state_notification_config = {
    pubsub_topic_name = "${google_pubsub_topic.car-info.id}"
  }

  http_config = {
    http_enabled_state = "HTTP_ENABLED"
  }

  mqtt_config = {
    mqtt_enabled_state = "MQTT_ENABLED"
  }
}