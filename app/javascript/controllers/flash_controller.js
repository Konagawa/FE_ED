import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.timeout = setTimeout(() => {
      this.element.classList.remove('show')
      this.element.classList.add('hide')
      setTimeout(() => {
        this.element.remove()
      }, 150)
    }, 3000) // 5秒後に非表示
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
