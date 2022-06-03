import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
"<h2 style=\"color: white\">I’m an Owner.</h2><h5>Find a trusted local animal lover to take care of your pet <br> when you can not. They will treat your pet like family! </h5> ^1000 <br><br><br><br><h2 style=\"color: white\">I’m a Borrower.</h2><h5>Fill the void in your life by spending time with animal <br> and helping out Owners at the same time! </h5> ^3000"
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
