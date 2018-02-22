$(document).on('turbolinks:load', function() {
  displayPlacesByType();

  $('#wagon_type').change(function(event) {
    displayPlacesByType();
  });
});

function displayPlacesByType() {
  var type = $('#wagon_type').val();
  if (type)
    displayByAttr('.places', 'types', type);
  else
    $('.places').hide();
}
