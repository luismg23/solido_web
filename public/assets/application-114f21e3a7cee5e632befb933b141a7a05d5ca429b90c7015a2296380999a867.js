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

Rails.start();
debounced.initialize({ ...debounced.events, keyup: { wait: 400 } })
;
