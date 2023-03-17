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
    // fetch(this.statusTarget.value, {
    //   method: "PATCH",
    //   headers: {"Accept": "application/json"},
    //   body: new StatusData(this.statusTarget)
    // })
    // .then(response => response.json())
    // .then((data) => {
    //   console.log(data)
    // })
  }

}
