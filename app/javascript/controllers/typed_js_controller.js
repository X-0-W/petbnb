import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
"<h2 style=\"color: white\">I’m an Owner.</h2><h5>Find a trusted local animal lover to take care of your pet when you can not. <br> They will treat your pet like family! </h5> ^1000 <br><br><br><br><h2 style=\"color: white\">I’m an Borrower.</h2><h5>Fill the void in your life ^300 <br> by spending time with animal and helping out Owners at the same time! </h5> ^3000"
    ],
      typeSpeed: 20,
      loop: true,
      showCursor: true,
      cursorChar: '|',
      autoInsertCss: true,
      contentType: 'html'
    });
  }
}
