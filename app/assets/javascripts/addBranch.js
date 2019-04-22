var index = 0
$("#addBranch").on('click', (e) => {
    var branch = document.createElement("INPUT")
    branch.setAttribute("type", "text")
    branch.setAttribute("class", "branch")
    branch.setAttribute("id", "branch[" + index + "]")
    $("#branches")[0].append(branch)
    
    
    var associated_button = document.createElement("span")
    associated_button.setAttribute("class", "delete")
    associated_button.innerHTML = "&#x274C;"
    $("#branches")[0].append(associated_button)
    index++;
});
