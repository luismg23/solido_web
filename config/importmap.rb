# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin_all_from "app/javascript/controllers", under: "controllers", preload: true
pin_all_from "app/javascript/lib", under: "lib", preload: true

pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "stimulus_reflex", to: "stimulus_reflex.js", preload: true
pin "debounced", to: "https://ga.jspm.io/npm:debounced@0.0.5/src/index.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.4/lib/assets/compiled/rails-ujs.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
pin "select2"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@4.6.0/dist/js/bootstrap.js"
pin "popper.js", to: "https://ga.jspm.io/npm:popper.js@1.16.1/dist/umd/popper.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.1.3/app/assets/javascripts/actioncable.esm.js"
pin "cable_ready", to: "cable_ready.js", preload: true
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.7.2/dist/morphdom-esm.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.2.2/dist/stimulus.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/channels", under: "channels"
pin_all_from "app/javascript/config", under: "config"
