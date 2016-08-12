$(window).on('page:load', function(){

  jQuery('.js-preview-image').each(function() {
    let preview = $(this);
    let input = $(this).find('input[type=file]');
    input.change(function() {
      let file = $(this).prop('files')[0];
      let fileReader = new FileReader();
      if (!this.files.length || !file.type.match('image.*')) {
        window.alert('error!')
      }
      fileReader.onload = function() {
        preview.css({
          'background-image': 'url(' + fileReader.result + ')'
        });
      };
      fileReader.readAsDataURL(file);
    })
  })
})
