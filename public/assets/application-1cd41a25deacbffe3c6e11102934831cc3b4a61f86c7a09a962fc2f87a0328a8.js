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

Rails.start();
debounced.initialize({ ...debounced.events, keyup: { wait: 400 } })
;
