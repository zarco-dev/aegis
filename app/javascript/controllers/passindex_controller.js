import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passindex"
export default class extends Controller {

  static targets = ["inputpass", "showpass", "eyenormal", "placetext"]
  connect() {
    console.log("hola desde index");
  }

  show() {
    if (this.inputpassTarget.type === "password") {
      this.inputpassTarget.type = "text";
      this.showpassTarget.classList.add("display-ojo");
      this.eyenormalTarget.classList.remove("display-ojo");
    } else if (this.inputpassTarget.type === "text") {
      this.inputpassTarget.type = "password";
      this.showpassTarget.classList.remove("display-ojo");
      this.eyenormalTarget.classList.add("display-ojo");
    }
  }

  copypass() {
    if (this.inputpassTarget.type === "password") {
    } else if (this.inputpassTarget.type === "text") {
      this.inputpassTarget.select();
      document.execCommand('copy');
      this.placetextTarget.classList.add('texto-aparece-animation-2');
      setTimeout(() => {
        this.placetextTarget.classList.remove('texto-aparece-animation-2');
      }, 3000);
    }
  }
}
