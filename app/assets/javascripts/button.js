function hide_show(name) {
  var x = document.getElementById(name);
  
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
} 


//
//$(document).ready(() => {
//document.body.onload(() => {
//  let hash = window.location.hash;
//  let element = $(hash+"_card");
  
//  console.debug(hash, element);
  
//  element.collapse('show');
//});