import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="signup"
export default class extends Controller {

  static targets = ["basic", "premium", "buttonpremium", "buttonbasic", "subscontainer", "signup", "titleplan", "premiumuser", "inputpass", "eyeslash", "eyenormal", "paramsbutton", "usernameinput"]

  connect() {
    if (this.paramsbuttonTarget.textContent == "true") {
      this.submitpremium();
    } else if (this.paramsbuttonTarget.textContent == "false") {
      this.submitbasic();
    }
    console.log(this.usernameinputTarget.value);
  }


  hover() {
    this.basicTarget.classList.add("scale-up");
    this.premiumTarget.classList.add("scale-reduce");
  }

  hoverp(){
    this.basicTarget.classList.remove("scale-up");
    this.premiumTarget.classList.remove("scale-reduce");
  }

  submitbasic(){
    this.subscontainerTarget.classList.add("subscription-container-display");
    this.signupTarget.classList.remove("form-sign-up");
    this.titleplanTarget.innerText = "Basic";
  }

  submitpremium() {
    this.subscontainerTarget.classList.add("subscription-container-display");
    this.signupTarget.classList.remove("form-sign-up");
    this.titleplanTarget.innerText = "Premium";
    this.premiumuserTarget.innerHTML = `<input autocomplete="off" type="hidden" value="true" name="user[premium_user]" id="user_premium_user">`;
  }

  showpass() {
    console.log(this.inputpassTarget.type);
    if (this.inputpassTarget.type === "password") {
      this.inputpassTarget.type = "text";
      this.eyeslashTarget.classList.add("display-ojo");
      this.eyenormalTarget.classList.remove("display-ojo");
    } else if (this.inputpassTarget.type === "text") {
      this.inputpassTarget.type = "password";
      this.eyeslashTarget.classList.remove("display-ojo");
      this.eyenormalTarget.classList.add("display-ojo");
    }
  }

  test() {
    console.log("hola");
  }

  useruser(event) {
    let valorInput = event.target.value;
    this.usernameinputTarget.value = valorInput.replace(/[0-9]/g, '');
    // console.log(this.usernameinputTarget.value);
  }

}
