// This is the javascript that allows real-time word count for the textbox
// in "new" view for provider
document.getElementById('textbox').addEventListener('input', function () {
        document.getElementById('count').style.color = "black";
        var text = this.value;
        var count;
        if (text != "") {
                count = text.trim().replace(/\s+/g, ' ').split(' ').length;
            
        } else {
                count = 0
        }
        document.getElementById('wordCount').textContent = count;
        
        if (count > 250) {
                document.getElementById('count').style.color = "red";
        }
    });