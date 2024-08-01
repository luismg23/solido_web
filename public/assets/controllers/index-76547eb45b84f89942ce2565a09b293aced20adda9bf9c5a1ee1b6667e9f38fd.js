import { Application } from "@hotwired/stimulus"
import StimulusReflex from 'stimulus_reflex'
import consumer from 'channels/consumer'

const application = Application.start()

application.consumer = consumer

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

eagerLoadControllersFrom("components", application)
eagerLoadControllersFrom("controllers", application)

StimulusReflex.initialize(application, { isolate: true });
