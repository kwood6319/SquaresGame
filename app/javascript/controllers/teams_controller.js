// app/javascript/controllers/teams_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "template"]

  addTeam() {
    const fields = document.querySelector(".team-fields").cloneNode(true)
    // Clear the cloned values
    fields.querySelectorAll("input[type=text]").forEach(i => i.value = "")
    document.getElementById("teams-container").appendChild(fields)
  }
}
