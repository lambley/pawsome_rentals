import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["filters", "dog", "cat", "card"]
  connect() {
    console.log("index-filter controller connected");
  }
  dogFilter(event) {
    console.log(event);
    
  }
}
