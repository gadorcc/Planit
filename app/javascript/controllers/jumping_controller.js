import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="jumping"
export default class extends Controller {
  static targets = ["form", "participant"]
  static values = { position: String }
  connect() {
    console.log(this.formTarget)
    console.log(this.participantTarget)
  }

  send(event) {
    event.preventDefault()
    console.log("TODO: send request in AJAX")

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          this.participantTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
        }
        // this.formTarget.outerHTML = data.form
      })

  }
}
