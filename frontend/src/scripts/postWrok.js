const Dropzone = require("dropzone");
Dropzone.autoDiscover = false;

module.exports = ($) => {
  $(document).ready(() => {
    if(!$("#my-awesome-dropzone").length) { return }
    new Dropzone("#my-awesome-dropzone", {
      paramName: "work[image]",
      maxFilesize: 5,
      uploadMultiple: false,
      addRemoveLinks: true,
      autoProcessQueue: false,
      dictDefaultMessage: "クリックしてファイルを選択するか、ファイルをドラッグアンドドロップしてください",
      dictFallbackMessage: "クリックしてファイルを選択してください",
      dictFileTooBig: "ファイルサイズは{{maxFilesize}}以下にしてください",
      thumbnailWidth: null,
      thumbnailHeight: 700,
      init() {
        $("#submitWork").on("click", (e) => {
          e.preventDefault();
          e.stopPropagation();
          this.processQueue();
        });
      }
    });
  })
};
