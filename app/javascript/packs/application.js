// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"
import * as ActiveStorage from "@rails/activestorage"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// CSS
import 'scss/site'
// JS
import('js/site')
// Images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

//= require jquery
//= require chosen-jquery
//= require country_state_select
//= require bootstrap
//= require font-awesome
