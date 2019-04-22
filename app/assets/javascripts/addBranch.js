var index = 0
$("#addBranch").on('click', (e) => {
    var branch = document.createElement("INPUT")
    branch.setAttribute("type", "text")
    branch.setAttribute("class", "branch")
    branch.setAttribute("id", "branch[" + index + "]")
    $("#branches")[0].append(branch)
});
