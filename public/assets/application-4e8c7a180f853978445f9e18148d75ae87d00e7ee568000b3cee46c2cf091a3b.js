console.log("entro");
import "@rails/ujs"
import "jquery"
import "select2"

import "controllers"
import "bootstrap"

import debounced from "debounced"
import Rails from '@rails/ujs'

Rails.start();
debounced.initialize({ ...debounced.events, keyup: { wait: 400 } });
