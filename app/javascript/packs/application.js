// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery
//= require chosen-jquery
//= require country_state_select

document.addEventListener("turbolinks:load", function(){
    var country = document.getElementById("country");
    var state = document.getElementById("state");

    country.addEventListener("change", function(){
        Rails.ajax({
            url: "/states?country=" + country.value,
            type: "GET"
        })
    })

    state.addEventListener("change", function(){
        Rails.ajax({
            url: "/cities?country=" + country.value + "&state=" + state.value,
            type: "GET"
        })
    })
})
    var city = document.getElementById("hometown");

// Clear the options in the select box
    while (city.firstChild) city.removeChild(city.firstChild);

// Add a placeholder
    var placeholder = document.createElement("option");
    placeholder.text = "Choose a city";
    placeholder.value = "";
    city.appendChild(placeholder);
