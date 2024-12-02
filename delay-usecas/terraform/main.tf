terraform {
  required_providers {
    time = {
      source = "hashicorp/time"
    }
    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }
}

provider "time" {}

provider "kubiya" {}

resource "kubiya_knowledge" "first_knowledge" {
  name        = "first knowledge - number 1 - immediately"
  groups      = ["Admin"]
  content     = "first knowledge content - number 1 - immediately"
  description = "first knowledge description - number 1 - immediately"
}

resource "time_sleep" "first_delay" {
  depends_on      = [kubiya_knowledge.first_knowledge]
  create_duration = var.first_delay
}

resource "kubiya_knowledge" "second_knowledge" {
  depends_on = [time_sleep.first_delay]

  name        = "second knowledge - number 2 - delayed 30 seconds"
  groups      = ["Admin"]
  content     = "second knowledge content - number 2 - delayed 30 seconds"
  description = "second knowledge description - number 2 - delayed 30 seconds"
}

resource "time_sleep" "second_delay" {
  depends_on      = [kubiya_knowledge.second_knowledge]
  create_duration = var.second_delay
}

resource "kubiya_knowledge" "third_knowledge" {
  depends_on = [time_sleep.second_delay]

  name        = "third knowledge - number 3 - delayed 30 seconds"
  groups      = ["Admin"]
  content     = "third knowledge content - number 3 - delayed 30 seconds"
  description = "third knowledge description - number 3 - delayed 30 seconds"
}
