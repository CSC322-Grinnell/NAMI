var index = $(".branch").length
$("#addBranch").on('click', (e) => {
    
    create_branch(index)
    index++;
});


function create_branch(index){
    var branch = document.createElement("INPUT")
    branch.setAttribute("type", "text")
    branch.setAttribute("class", "branch")
    branch.setAttribute("multiple", "true")
    branch.setAttribute("name", "service[branch][]")
    
    var associated_button = document.createElement("span")
    associated_button.setAttribute("class", "delete")
    associated_button.setAttribute("id", index)
    associated_button.innerHTML = "&#x274C;"
    $("#branches")[0].append(associated_button)
    
    //container of the input and the delete mark
    var box = document.createElement("DIV")
    box.setAttribute("id", "branch[" + index + "]")
    box.append(branch)
    box.append(associated_button)
    $("#branches")[0].append(box)
    
    $(associated_button).on('click', (e) => {
        var id = e.target.id;
        console.log(id)
        var branch_name = "#branch\\[" + id + "\\]";
        $(branch_name).remove()
    })
}

$(".delete").on('click', (e) => {
    var id = e.target.id;
    console.log(id)
    var branch_name = "#branch\\[" + id + "\\]";
    console.log(branch_name)
    $(branch_name).remove()
})