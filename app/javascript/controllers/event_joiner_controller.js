import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("RSVP controller connected")
  }

  toggle(event) {
    event.preventDefault()
    this.element.requestSubmit()
  }
}
