function hide_show(name) {
  var x = document.getElementById(name);
  
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
} 

function cPsychotherapy(name){
  var x = document.getElementById(name);
  x.collapse('hide');
}