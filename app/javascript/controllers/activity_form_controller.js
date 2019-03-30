import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['name', 'nameTitle']

  initialize() {
    console.log("Initialized")
  }

  nameChange() {
    let newName = this.nameTarget.value
    if (newName === "") {
      this.nameTitleTarget.textContent = "New activity"
    } else {
      this.nameTitleTarget.textContent = this.nameTarget.value
    }
  }
}
