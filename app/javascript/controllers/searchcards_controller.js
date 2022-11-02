import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchcards"
export default class extends Controller {

  static targets = ["searchcard", "inputsearch", "listcard"]

  connect() {
    // console.log("holi");
  }

  showcards() {
    const url = `${this.searchcardTarget.action}?query=${this.inputsearchTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listcardTarget.outerHTML = data
      // console.log(data);
    })
  }
}
