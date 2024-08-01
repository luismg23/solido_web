import ApplicationController from '../lib/application_controller'

export default class extends ApplicationController {
  connect () {
    super.connect()
    console.log('hola');
  }

};
