import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
    console.log("Hola from dropdown controller")
  }
  change_status() {
    console.log(event);
  }
}
