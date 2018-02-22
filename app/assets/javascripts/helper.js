function inlineEditResource(resource) {
  $(`a.edit_${resource}`).click(function(link) {
    link.preventDefault();
    let current = $(this);

    let resourceId = current.data(`${camelize(resource)}Id`);
    let title = $(`#${resource}_title_${resourceId}`);
    let form  = $(`#edit_${resource}_${resourceId}`);
    let cell = form.parent('td');

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
  $(selector).each((index, elem) => {
    let domObject = $(elem);
    if (domObject.data(attr).indexOf(value) > -1)
      domObject.show();
    else
      domObject.hide();
  });
}
