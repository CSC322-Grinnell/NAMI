// This is the javascript that allows real-time word count for the textbox
// in "new" view for provider
document.getElementById('textbox').addEventListener('input', function () {
        var text = this.value,
        count = text.trim().replace(/\s+/g, ' ').split(' ').length;
        document.getElementById('wordCount').textContent = count;

    });