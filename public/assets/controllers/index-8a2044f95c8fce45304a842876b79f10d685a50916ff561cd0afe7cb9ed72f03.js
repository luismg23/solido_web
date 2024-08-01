import StimulusReflex from "stimulus_reflex";
import { application } from "./application";
import { cable } from "@hotwired/turbo-rails";

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

const consumer = await cable.getConsumer()
StimulusReflex.initialize(application, { consumer, debug: true });
