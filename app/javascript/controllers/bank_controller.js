import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bank"
let opcion = document.createElement('option');
opcion.value = null;
opcion.innerText = "Mes"
opcion.selected = "selected";

let opcion2 = document.createElement('option');
opcion2.value = null;
opcion2.innerText = "Año"
opcion2.selected = "selected";


export default class extends Controller {

  static targets = ["tarjeta", "btnabrir", "form", "inputnumero", "inputnombre", "inputcvc", "selectdate", "numbercard", "namecard", "expiratemonth", "expirateyear", "logofranquicia", "firma", "cvc", "groupselect", "franq", "colorpicker", "colorcard", "colorground"]

  mostrarFrente() {
    if (this.tarjetaTarget.classList.contains('active')) {
      this.tarjetaTarget.classList.remove('active');
    }
  }

  mostrarBack() {
    if (!this.tarjetaTarget.classList.contains('active')) {
      this.tarjetaTarget.classList.add('active');
    }
  }


  show() {
    this.tarjetaTarget.classList.toggle("active");
  }

  open() {
    this.btnabrirTarget.classList.toggle("active");
    this.formTarget.classList.toggle("active");
    this.groupselectTarget.firstElementChild.lastElementChild.children[1].insertAdjacentElement("afterbegin", opcion);
    this.groupselectTarget.firstElementChild.lastElementChild.children[2].insertAdjacentElement("afterbegin", opcion2);
    this.formTarget.classList.toggle('display-form-bank')
  }

  acnumber(event) {

    let valorInput = event.target.value;
    this.inputnumeroTarget.value = valorInput
    .replace(/\s/g, '')
    .replace(/\D/g, '')
    .replace(/([0-9]{4})/g, '$1 ').trim();
    this.numbercardTarget.textContent = valorInput;

    if(valorInput == '') {
      this.numbercardTarget.textContent = '#### #### #### ####'
      this.logofranquiciaTarget.innerHTML = ''
    }

    if (valorInput[0] == 4) {
      this.logofranquiciaTarget.innerHTML = '';
      const imagen = document.createElement('img');
      imagen.src = 'https://i.imgur.com/anaH5uw.png';
      this.logofranquiciaTarget.appendChild(imagen);
      this.franqTarget.value = 'https://i.imgur.com/anaH5uw.png'

    } else if(valorInput[0] == 5) {
      this.logofranquiciaTarget.innerHTML = '';
      const imagen = document.createElement('img');
      imagen.src = 'https://i.imgur.com/2dWHdkY.png';
      this.logofranquiciaTarget.appendChild(imagen);
      this.franqTarget.value = 'https://i.imgur.com/2dWHdkY.png'
    } else {
      this.logofranquiciaTarget.innerHTML = '';
      const imagen = document.createElement('img');
      imagen.src = 'https://i.imgur.com/CgUPMHR.png';
      this.logofranquiciaTarget.appendChild(imagen);
    }

    this.mostrarFrente();
  }

  acname(event) {
    let valorInput = event.target.value;
    this.inputnombreTarget.value = valorInput.replace(/[0-9]/g, '');
    this.namecardTarget.textContent = valorInput;
    this.firmaTarget.textContent = valorInput;

    if(valorInput == '') {
      this.namecardTarget.textContent = 'Sebas Restrepo'
    }

    this.mostrarFrente();
  }

  selectdate() {
    this.mostrarFrente();
    let valormonth = this.groupselectTarget.firstElementChild.lastElementChild.children[1].value;
    let valoryear = this.groupselectTarget.firstElementChild.lastElementChild.children[2].value
    console.log(valormonth);
    let valoryearf = `${valoryear[2]}${valoryear[3]}`

    if(valormonth === "null") {
      this.expiratemonthTarget.textContent = "MM"
    } else {
      if (valormonth < 10) {
        this.expiratemonthTarget.textContent = `0${valormonth}`
      } else {
        this.expiratemonthTarget.textContent = valormonth;
      }
    }

    if(valoryear === "null") {
      this.expirateyearTarget.textContent = "AA"
    } else {
    this.expirateyearTarget.textContent = valoryearf
    }
  }

  cvc() {
    this.mostrarBack();
    this.inputcvcTarget.value = this.inputcvcTarget.value.replace(/\s/g, '').replace(/\D/g, '');
    this.cvcTarget.textContent = this.inputcvcTarget.value;
  }

  colorpick() {
    this.colorcardTargets.forEach(element => {
      element.setAttribute("style", `background-color: ${this.colorpickerTarget.value}7e;` )
    });
    this.colorgroundTarget.value = `${this.colorpickerTarget.value}7e`
  }
}
