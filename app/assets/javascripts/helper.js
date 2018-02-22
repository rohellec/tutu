function displayByAttr(selector, attr, value) {
  $(selector).each((index, elem) => {
    let domObject = $(elem);
    if (domObject.data(attr).indexOf(value) > -1)
      domObject.show();
    else
      domObject.hide();
  });
}
