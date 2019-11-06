const fileInput = document.getElementById('inputProfile');
const previewInner = document.getElementById('profilePreviewInner')
// プロフィール画像を選択したら、画像が変わる
fileInput.addEventListener('change', function (evt) {
  document.getElementById("profile-image").style.display="none";
  if (document.getElementById('profilePreviewPicture') != null) {
    while (previewInner.firstChild) {
      previewInner.removeChild(previewInner.firstChild);
    }
  }
  const file = fileInput.files[0];
  console.log(file)
  var blobUrl = window.URL.createObjectURL(file);
  console.log(blobUrl)
  var img = document.createElement("img");
  img.setAttribute("src", blobUrl);
  img.setAttribute("class", "profile-preview-picture");
  img.setAttribute("id", "profilePreviewPicture");
  previewInner.appendChild(img);
});