import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["status"]

  connect() {
    console.log("Hola from dropdown controller")
  }
  changeStatus() {
    // this.statusTarget.value
    console.log(this.statusTarget.value);
    console.log("mojon")
  }
}
