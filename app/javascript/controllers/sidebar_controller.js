import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {

  static targets = ["sidebarnav", "togglet", "searchbox", "toggleswitch", "modetext", "colorbank"]

  connect() {
    console.log(this.colorbankTarget);
  }

  darkmode() {
    this.sidebarnavTarget.classList.toggle("dark");


    if (this.sidebarnavTarget.classList.contains("dark")) {
      this.modetextTarget.innerText = "Ligth Mode"
    } else {
      this.modetextTarget.innerText = "Dark Mode"
    }
  }

  responsive() {
    this.sidebarnavTarget.classList.toggle("close");
  }

  searchbtn() {
    this.sidebarnavTarget.classList.remove("close");
  }
}
