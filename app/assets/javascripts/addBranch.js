var index = 0
$("#addBranch").on('click', (e) => {
    var branch = document.createElement("INPUT")
    branch.setAttribute("type", "text")
    branch.setAttribute("class", "branch")
    branch.setAttribute("multiple", "true")
    branch.setAttribute("name", "service[branch][]")
    branch.setAttribute("id", "branch[" + index + "]")
    $("#branches")[0].append(branch)
    
    
    var associated_button = document.createElement("span")
    associated_button.setAttribute("class", "delete")
    associated_button.setAttribute("id", index)
    associated_button.innerHTML = "&#x274C;"
    $("#branches")[0].append(associated_button)
    
    $(associated_button).on('click', (e) => {
        var id = e.target.id
        var branch_name = "#branch[" + id + "]"
        console.log(branch_name)
        $(branch_name).remove();
        $(this).remove()
    })
    
    index++;
});