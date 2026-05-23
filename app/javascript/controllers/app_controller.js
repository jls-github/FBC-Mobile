import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Register service worker for PWA
    if ("serviceWorker" in navigator) {
      navigator.serviceWorker.register("/service-worker").catch(() => {})
    }
  }
}
