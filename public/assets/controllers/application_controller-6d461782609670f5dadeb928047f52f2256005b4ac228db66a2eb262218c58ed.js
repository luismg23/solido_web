import { Controller } from 'stimulus'

export default class extends Controller {
  connect () {
    console.log('ontro')
    StimulusReflex.register(this)
  }

  beforeReflex (element, reflex, noop, reflexId) {
    // document.body.classList.add('wait')
  }

  reflexSuccess (element, reflex, noop, reflexId) {
    // show success message
  }

  reflexError (element, reflex, error, reflexId) {
    // show error message
  }

  reflexHalted (element, reflex, error, reflexId) {
    // handle aborted Reflex action
  }

  afterReflex (element, reflex, noop, reflexId) {
    // document.body.classList.remove('wait')
  }

  finalizeReflex (element, reflex, noop, reflexId) {
    // all operations have completed, animation etc is now safe
  }
};
