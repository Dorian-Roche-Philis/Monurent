// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// // ----------------------------------------------------

import "bootstrap";


import { initMapbox } from '../plugins/init_mapbox';

import flatpickr from "flatpickr";


// Obviously doesn't need to be on window
window.scrollPosition = {x: 0, y: 0} // Our 'old' scroll position
window.lastHref = null // Our 'old' page href
// Before visit, simply store scroll position & url/href
document.addEventListener('turbolinks:before-visit', function () {
  window.scrollPosition = {x: window.scrollX, y: window.scrollY}
  window.lastHref = window.location.href
}, false)
// After load
document.addEventListener('turbolinks:load', function () {
  // If we have a scroll position AND we're on the same page
  if (window.scrollPosition && (this.location.href == window.lastHref)) {
    // Scroll to our previous position
    window.scrollTo(window.scrollPosition.x, window.scrollPosition.y)
  }
  initMapbox();
  flatpickr(".start-flatpickr", {
    onChange: function(selectedDates, dateStr, instance) {
      document.querySelector("#booking_start_date").value = dateStr
    }
  });
  flatpickr(".end-flatpickr", {
    onChange: function(selectedDates, dateStr, instance) {
      document.querySelector("#booking_end_date").value = dateStr
    }
  });

}, false)


