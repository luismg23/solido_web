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

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

window.Stimulus = Application.start()
const context = require.context("./controllers", true, /\.js$/)
Stimulus.load(definitionsFromContext(context))

Rails.start();
debounced.initialize({ ...debounced.events, keyup: { wait: 400 } })
;
