import { Controller } from '@hotwired/stimulus'
import { hiddenClass } from 'lib/css_class'

export default class extends Controller {
  initialize() {
    console.log('aloha');
  }
};
