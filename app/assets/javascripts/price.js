$(document).on('turbolinks:load', function () {
  $('#hiring-time').on("change", function() {
    var total = parseInt($('#vehicle-price').html())*parseInt($('#hiring-time').val());
    $('#total').html(total+ " VND")
  });

  $('#btn-submit').on("click", function() {
    $(this).prop('disabled', true);
  });

  $('#vehicles-table').dataTable( {
    language: {
      search: I18n.t("admin.vehicles.index.input"),
      searchPlaceholder: I18n.t("admin.vehicles.index.search")
    },
  });

  $('#table').dataTable( {
    language: {
      search: I18n.t("admin.vehicles.index.input"),
      searchPlaceholder: I18n.t("admin.vehicles.index.search")
    },
  });
  
})
function upload(event){
  var input = $(event.currentTarget);
  var file = input[0].files[0];
  var reader = new FileReader();
  reader.onload = function(e){
      image_base64 = e.target.result;
      $(".upload-preview img").attr("src", image_base64);
  };
  reader.readAsDataURL(file);
}
