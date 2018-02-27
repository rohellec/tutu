function inlineEditResource(resource) {
  var editUrl = 'a.edit_' + resource;
  $(editUrl).click(function(link) {
    link.preventDefault();
    var current = $(this);

    var resourceId = current.data(camelize(resource) + 'Id');
    var titleId = '#' + resource + '_title_' + resourceId;
    var formId  = '#edit_' + resource + '_'  + resourceId;

    var title = $(titleId);
    var form  = $(formId);
    var cell = form.parent('td');

    if (!current.hasClass('cancel')) {
      current.text(I18n.cancel);
      current.addClass('cancel');
      cell.removeClass('cell-17')
          .attr('colspan', '2')
          .next().remove();
    } else {
      current.text(I18n.edit);
      current.removeClass('cancel');
      cell.addClass('cell-17')
          .removeAttr('colspan')
          .after('<td class="cell-45"></td>');
    }

    title.toggle();
    form.toggle();
  });
}

function camelize(text) {
  return text.replace(/[\W_]+(\w)/g, function(match, letter) {
    return letter.toUpperCase();
  });
}

function displayByAttr(selector, attr, value) {
  $(selector).each(function(index, elem) {
    var domObject = $(elem);
    if (domObject.data(attr).indexOf(value) > -1)
      domObject.show();
    else
      domObject.hide();
  });
}
