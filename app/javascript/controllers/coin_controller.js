import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url" ]



  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log(this.urlTarget.innerHTML)
  }

  update(event) {
    window.open(this.urlTarget.innerHTML, '_blank');
  }
}
