import { Controller } from "@hotwired/stimulus"

const abbr = document.querySelectorAll("abbr");

// Connects to data-controller="passnew"
export default class extends Controller {

  static targets = ["siteurl", "fav", "generatepass", "titulopassword", "passpass"]

  connect() {
    abbr.forEach((element) => {
      element.setAttribute("style", "display: none;");
    });
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
