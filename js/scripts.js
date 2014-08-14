jQuery(document).ready(function($) {
  
    "use strict";
    
    // Remove JS class
    
    $("html").removeClass("no-js");
    
});

// Add browser/touch information

var b = document.documentElement;
b.setAttribute('data-useragent',  navigator.userAgent);
b.setAttribute('data-platform', navigator.platform );
b.className += ((!!('ontouchstart' in window) || !!('onmsgesturechange' in window))?' touch':'');