import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="explorer"
export default class extends Controller {
  static targets = ["main", "content"];
  connect() {
    console.log("Hello, Stimulus!");
  }

  toggle() {
    // Affiche ou masque le contenu
    if (this.contentTarget.style.display === "none") {
      this.contentTarget.style.display = "block";
      this.mainTarget.style.display = "none";
    } else {
      this.contentTarget.style.display = "none";
      this.mainTarget.style.display = "block";
    }
  }
  rollback() {
    this.contentTarget.style.display = "none";
    this.mainTarget.style.display = "block";
  }
}
