import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passnew"
export default class extends Controller {

  static targets = ["siteurl", "fav", "generatepass", "titulopassword"]

  connect() {

  }

  urlicon() {
    this.favTarget.value = this.siteurlTarget.value
  }

  showg() {
    console.log("holi aqui g");
    this.generatepassTarget.classList.add("pass-c-p-s");
    this.titulopasswordTarget.classList.add("ocultar-t-p");
  }

}
