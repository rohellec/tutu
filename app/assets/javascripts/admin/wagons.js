$(document).on('turbolinks:load', function() {
  displayPlacesByType();

  $('#wagon_type').change(event => {
    displayPlacesByType();
  });
});

function displayPlacesByType() {
  let type = $('#wagon_type').val();
  if (type)
    displayByAttr('.places', 'types', type);
  else
    $('.places').hide();
}
