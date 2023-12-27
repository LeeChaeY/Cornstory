$('.drop-area').on('drag dragstart dragend dragover dragenter dragleave drop', function (event) {
    event.preventDefault();
    event.stopPropagation();
});
$(".drop-area").on("dragover", function (event) {
    $(this).addClass('drag-over');
});
$(".drop-area").on("dragleave dragend drop", function (event) {
    $(this).removeClass('drag-over');
});
$(".drop-area").on("drop", function (event) {
    event.preventDefault();
    event.stopPropagation();

    if (event.originalEvent.dataTransfer.files.length === 1) {
        const files = event.originalEvent.dataTransfer.files;

        // Display the uploaded file
        displayFile(files[0]);
        $("input[name='supfile']")[0].files = files;
    } else {
        alert('Please drop only one file at a time.');
    }

    // Remove highlight from drop area
    $(this).removeClass('drag-over');
});

$("input[type='file']").on("change", function (event) {
    const file = this.files[0];
    displayFile(file);
});
function displayFile(file) {
    const listItem = $("<li>");
    let reader = new FileReader();
    reader.onload = function (e) {
        listItem.html('<img src="' + e.target.result + '" alt="your image"/>');
    };
    reader.readAsDataURL(file);
    $(".file-list").empty().append(listItem);
}
