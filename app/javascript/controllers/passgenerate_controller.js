import { Controller } from "@hotwired/stimulus"


let caracteres = {
  numeros: '0 1 2 3 4 5 6 7 8 9',
  simbolos: '. + - * / , ; ] [ ? > < | : } { = _ ( ) & ^ % $ # @ ! ~ ',
  mayusculas: 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',
  minusculas: 'a b c d e f g h i j k l m n o p q r s t u v w x y z'
}

let configuracion = {
  simbolos: true,
  numeros: true,
  mayusculas: true,
  minusculas: true
}

function generarPassword(sizepass) {
  let caracteresFinales = '';
  let password = '';
  var i = '';

  for(i in configuracion) {
    if(configuracion[i] == true) {
      caracteresFinales += caracteres[i] + ' ';
    }
  }
  caracteresFinales = caracteresFinales.trim();
  caracteresFinales = caracteresFinales.split(' ');

  for(var i = 0; i < sizepass; i++) {
    password += caracteresFinales[Math.floor(Math.random() * caracteresFinales.length)];
  }
  return password;
}


export default class extends Controller {

  static targets = ["lengthnumber", "rangeinput", "textinput", "mayus", "numbers", "symbols", "divcarga", "textshow", "passpass"]

  connect() {
    this.textinputTarget.value = generarPassword(this.rangeinputTarget.value);
    this.divcargaTarget.setAttribute("style", "background-color: green; width: 101%; transition: width .63s,background-color .2s;")

  }


  range() {
    let sizepass = this.rangeinputTarget.value
    let pass = generarPassword(parseInt(sizepass));
    this.lengthnumberTarget.value = this.rangeinputTarget.value
    this.textinputTarget.value = pass;
    if (sizepass == 0) {
      this.divcargaTarget.setAttribute("style", "background-color: transparent; width: 0%; transition: width .63s,background-color .2s;")
    } else if (sizepass > 0 && sizepass < 8) {
      this.divcargaTarget.setAttribute("style", "background-color: red; width: 25%; transition: width .63s,background-color .2s;")
    } else if (sizepass > 7 && sizepass < 17) {
      this.divcargaTarget.setAttribute("style", "background-color: yellow; width: 50%; transition: width .63s,background-color .2s;")
    } else if (sizepass > 16 && sizepass < 36) {
      this.divcargaTarget.setAttribute("style", "background-color: green; width: 101%; transition: width .63s,background-color .2s;")
    }
    this.passpassTarget.value = this.textinputTarget.value;
  }

  text() {
    var longitud = this.textinputTarget.value;
    let sizepass = this.rangeinputTarget.value
    this.lengthnumberTarget.value = longitud.length
    this.rangeinputTarget.value = longitud.length
    if (sizepass == 0) {
      this.divcargaTarget.setAttribute("style", "background-color: transparent; width: 0%; transition: width .63s,background-color .2s;")
    } else if (sizepass > 0 && sizepass < 8) {
      this.divcargaTarget.setAttribute("style", "background-color: red; width: 25%; transition: width .63s,background-color .2s;")
    } else if (sizepass > 7 && sizepass < 17) {
      this.divcargaTarget.setAttribute("style", "background-color: yellow; width: 50%; transition: width .63s,background-color .2s;")
    } else if (sizepass > 16 && sizepass < 36) {
      this.divcargaTarget.setAttribute("style", "background-color: green; width: 101%; transition: width .63s,background-color .2s;")
    }
  }

  checkbox1() {
    configuracion.mayusculas = !configuracion.mayusculas;
    this.textinputTarget.value = generarPassword(this.rangeinputTarget.value);
    this.passpassTarget.value = this.textinputTarget.value
  }

  checkbox2() {
    configuracion.numeros = !configuracion.numeros;
    this.textinputTarget.value = generarPassword(this.rangeinputTarget.value);
    this.passpassTarget.value = this.textinputTarget.value
  }

  checkbox3() {
    configuracion.simbolos = !configuracion.simbolos;
    this.textinputTarget.value = generarPassword(this.rangeinputTarget.value);
    this.passpassTarget.value = this.textinputTarget.value
  }

  copypass() {
    this.textinputTarget.select();
    document.execCommand('copy');
    this.textshowTarget.classList.add('texto-aparece-animation');
    setTimeout(() => {
      this.textshowTarget.classList.remove('texto-aparece-animation');
    }, 5000);
  }
}
