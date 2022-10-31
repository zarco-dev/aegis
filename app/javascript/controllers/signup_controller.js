import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="signup"
export default class extends Controller {

  static targets = ["basic", "premium", "buttonpremium", "buttonbasic", "subscontainer", "signup", "titleplan", "premiumuser"]


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

}
