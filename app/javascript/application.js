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
import "./companies"
import "./suppliers"

window.Stimulus = Application.start()
import HelloController from "./controllers/home_controller"

window.Stimulus = Application.start()
Stimulus.register("hello", HelloController)

import "./controllers/home_controller"
import "config"
import "channels"

Rails.start();
debounced.initialize({ ...debounced.events, keyup: { wait: 400 } })