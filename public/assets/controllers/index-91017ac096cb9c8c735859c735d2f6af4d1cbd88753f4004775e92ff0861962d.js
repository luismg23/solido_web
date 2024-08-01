import { Application } from "@hotwired/stimulus"

import HomeController from './home_controller.js'

const application = Application.start()
window.Stimulus = Application.start()

application.register('home', HomeController)
console.log('en el index')
try {
    console.log('intentando')
    window.Stimulus = Application.start()
    application.register('home', HomeController)
    console.log('avanzo')
} catch (error) {
    console.error("Se ha producido un error:", error)
  }
  ;
