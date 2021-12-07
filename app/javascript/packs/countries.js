import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

document.addEventListener("turbolinks:load", function(){
    var country = document.getElementById("user_country");
    var state = document.getElementById("user_state");

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