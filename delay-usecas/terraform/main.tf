terraform {
  required_providers {
    time = {
      source = "hashicorp/time"
    }
  }
}

provider "time" {}

resource "time_sleep" "first_delay" {
  create_duration = var.delay
}
resource "time_sleep" "second_delay" {
  depends_on      = [time_sleep.first_delay]
  create_duration = var.delay
}
resource "time_sleep" "third_delay" {
  depends_on      = [time_sleep.second_delay]
  create_duration = var.delay
}
resource "time_sleep" "fourth_delay" {
  depends_on      = [time_sleep.third_delay]
  create_duration = var.delay
}
resource "time_sleep" "fifth_delay" {
  depends_on      = [time_sleep.fourth_delay]
  create_duration = var.delay
}
