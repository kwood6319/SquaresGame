import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Turn controller connected")
  }

  select(event) {
    const square = event.currentTarget.dataset.index
    const squareInput = document.getElementById("turn-square")
    const form = document.getElementById("turn-form")

    // Immediately mark square as visited
    event.currentTarget.classList.add("square--visited")
    event.currentTarget.removeAttribute("data-action")

    squareInput.value = square
    form.requestSubmit()
  }
}
