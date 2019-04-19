// $(document).ready(function(){
//   document.getElementById("#addBranch").click(function(){
//       alert("hello")
//     // document.getElementById("#branches").append(document.getElementById("#new_service_branch"));
//   });
// });

$(document).ready(function(){
    $("#addBranch").click(function(){
        $("#branches").append($("#new_service_branch"))
    })
})