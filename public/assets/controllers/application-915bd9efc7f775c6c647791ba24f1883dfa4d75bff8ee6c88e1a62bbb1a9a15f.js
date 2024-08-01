import { Application } from "@hotwired/stimulus"
import consumer from 'channels/consumer'

const application = Application.start()

application.debug = false
window.Stimulus   = application
application.consumer = consumer

export { application };
