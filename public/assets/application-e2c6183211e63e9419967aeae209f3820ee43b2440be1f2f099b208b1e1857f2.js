import { Application } from "@hotwired/stimulus"

import "@rails/ujs"
import "lib/jquery"
import "select2"

import "controllers"
import "bootstrap"

import debounced from "debounced"
import Rails from '@rails/ujs'

import "./actions" 
import "./budgets"
import "./checks"
import "./pendings"
import "./details"
window.Stimulus = Application.start()
console.log('entro?')
import HelloController from "./controllers/home_controller"

window.Stimulus = Application.start()
Stimulus.register("hello", HelloController)

import "./controllers/home_controller"

Rails.start();
debounced.initialize({ ...debounced.events, keyup: { wait: 400 } });
