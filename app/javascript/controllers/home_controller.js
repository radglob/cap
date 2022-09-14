import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["people"]

  initialize() {
    this.peopleTypes = ["artists", "cyclists", "students", "commuters", "makers", "gardeners", "parents", "dog walkers", "volunteers", "activists", "educators", "seniors", "friends"]
  }

  typeContent(index) {
    let content = this.peopleTypes[index]
    let length = 1
    let display = content.slice(0, length)
    let targetLength = content.length
    this.timer = setInterval(() => {
      this.peopleTarget.textContent = display;
      let colorClass = index % 2 == 0 ? "text-maroon-dark" : "text-gold";
      this.peopleTarget.classList = [colorClass]
      targetLength > length ? length++ : length--
      display = content.slice(0, length)
      // Don't rewind text on last entry.
      if (length > targetLength && index === this.peopleTypes.length - 1) {
        clearInterval(this.timer)
        return
      }
      // Rewind text.
      if (length === targetLength && targetLength !== 0) targetLength = 0
      // After we rewind and reach the beginning of the text, move onto the next text.
      if (length < targetLength && targetLength === 0) { 
        clearInterval(this.timer)
        this.typeContent(index + 1)
      }
    }, 75)
  }

  connect() {
    this.typeContent(0)
  }
}
