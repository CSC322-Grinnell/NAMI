$("#addBranch").on('click', (e) => {
    var branch = document.createElement("INPUT")
    branch.setAttribute("type", "text")
    branch.setAttribute("class", "branch")
    $("#branches")[0].append(branch)
});
