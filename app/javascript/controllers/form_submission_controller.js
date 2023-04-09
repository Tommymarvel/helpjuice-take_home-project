import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['form', 'finished'];

  search() {
    clearTimeout(this.inputTimeout);
    this.inputTimeout = setTimeout(() => {
      this.formTarget.requestSubmit();
    }, 300);
  }

  create() {
    this.finishedTarget.value = true;
    this.formTarget.requestSubmit();
    this.finishedTarget.value = false;
  }
}
