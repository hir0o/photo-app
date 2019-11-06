const fileArea = document.getElementById('drag-drop-area');
const fileInput = document.getElementById('file-picture');
const preview = document.getElementById('preview');
const previewInner = document.getElementById("preview-inner")
fileArea.addEventListener('dragover', function (evt) {
  evt.preventDefault();
  fileArea.classList.add('dragover');
});
fileArea.addEventListener('dragleave', function (evt) {
  evt.preventDefault();
  fileArea.classList.remove('dragover');
});
// droした時
fileArea.addEventListener('drop', function (evt) {
  evt.preventDefault();
  fileArea.classList.remove('dragenter');
  preview.classList.add('preview__on');
  if (document.getElementById('previewPicture') != null) {
    while (previewInner.firstChild) {
      previewInner.removeChild(previewInner.firstChild);
    }
  }
  var files = evt.dataTransfer.files;
  fileInput.files = files;
  filePreview(files);
  console.log(fileInput.files[0]);
});
// 写真を選択からinputした場合
fileInput.addEventListener('change', function (evt) {
  if (document.getElementById('previewPicture') != null) {
    while (previewInner.firstChild) {
      previewInner.removeChild(previewInner.firstChild);
    }
  }
  const files = fileInput.files;
  filePreview(files);
});
// fileをプレビューする関数
function filePreview(files) {
  preview.classList.add('preview__on')
  for (let i = 0; i < files.length; i++) {
    var imageFile = files[i];
    var blobUrl = window.URL.createObjectURL(imageFile);
    console.log(blobUrl)
    var img = document.createElement("img");
    img.setAttribute("src", blobUrl);
    img.setAttribute("class", "preview-picture");
    img.setAttribute("id", "previewPicture");
    previewInner.appendChild(img);
  }
}