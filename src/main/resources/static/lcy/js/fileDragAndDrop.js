document.addEventListener("DOMContentLoaded", function() {
    const dropArea = document.getElementById("dropArea");
    const fileInput = document.getElementById("fileInput");
    const fileList = document.getElementById("fileList");

    dropArea.addEventListener("dragover", function(e) {
        e.preventDefault();
        dropArea.classList.add("drag-over");
    });

    dropArea.addEventListener("dragleave", function() {
        dropArea.classList.remove("drag-over");
    });

    dropArea.addEventListener("drop", function(e) {
        e.preventDefault();
        dropArea.classList.remove("drag-over");

        const files = e.dataTransfer.files;
        handleFiles(files);
    });

    fileInput.addEventListener("change", function() {
        const files = fileInput.files;
        handleFiles(files);
    });

    function handleFiles(files) {
        fileList.innerHTML = ""; // Clear previous file list

        for (const file of files) {
            const listItem = document.createElement("li");
            var reader = new FileReader();
            reader.onload = function (e) {
                listItem.innerHTML = '<img id="blah" width="200px" height="200px" src="${e.target.result}" alt="your image"/>';
            }
            reader.readAsDataURL(file);
            fileList.appendChild(listItem);
        }
    }
});