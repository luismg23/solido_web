import { Application } from "@hotwired/stimulus"

import HomeController from './home_controller.js'

const application = Application.start()
window.Stimulus = Application.start()

application.register('home', HomeController)
try {
    console.log('intentando')
    console.log(HomeController)
    window.Stimulus = Application.start()
    Stimulus.register("hello", HomeController)
    console.log('avanzo')
    Stimulus.handleError = (error, message, detail) => {
        console.warn(message, detail)
        ErrorTrackingSystem.captureException(error)
      }
      
} catch (error) {
    console.error("Se ha producido un error:", error)
  }
  ;
