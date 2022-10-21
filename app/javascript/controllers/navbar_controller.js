import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["menu"]

  connect() {
  }

  menutoggle() {
    this.menuTarget.classList.toggle('active');
  }
}
