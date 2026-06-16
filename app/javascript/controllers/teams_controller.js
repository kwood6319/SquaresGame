import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  addTeam() {
    const teamCount = this.containerTarget.querySelectorAll(".team-fields").length + 1
    const clone = this.containerTarget.querySelector(".team-fields").cloneNode(true)

    // Set placeholder to "Team N"
    clone.querySelectorAll("input[type=text], input:not([type])").forEach(i => {
      i.value = ""
      i.placeholder = `Team ${teamCount}`
    })

    // Assign a random colour
    clone.querySelectorAll("input[type=color]").forEach(i => {
      i.value = this.randomColour()
    })

    this.containerTarget.appendChild(clone)
  }

  randomColour() {
    const colours = [
      "#E63946", "#2A9D8F", "#E9C46A", "#F4A261",
      "#457B9D", "#8338EC", "#FB5607", "#3A86FF",
      "#06D6A0", "#FF006E", "#FFBE0B", "#8ECAE6"
    ]
    return colours[Math.floor(Math.random() * colours.length)]
  }
}
