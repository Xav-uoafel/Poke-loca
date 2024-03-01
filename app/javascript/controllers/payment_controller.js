import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="payment"
export default class extends Controller {
  static targets = ["main", "content", "form", "payments"];
  connect() {
    console.log("Hello, Stimulus!");
  }

  submit(event) {
    event.preventDefault(); //
    this.formTarget.style.display = "none"; //  le formulaire
    this.paymentsTarget.style.display = "block"; // le paiement
  }
}
