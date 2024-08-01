import { Application } from "@hotwired/stimulus"

import HomeController from './home_controller.js'

const application = Application.start()
window.Stimulus = Application.start()

application.register('home', HomeController)
console.log('en el index');
