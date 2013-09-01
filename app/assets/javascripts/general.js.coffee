jQuery ->
  states = $('#product_brand_id').html()
  state_empty = "<option value=''>#{$('#product_brand_id option:eq(0)').html()}</option>"
  $('#product_category_id').change ->
    category = $('#product_category_id :selected')
    escaped_category = category.text().replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label=#{escaped_category}]").html()
    if options
      $('#product_brand_id').html(state_empty + options)
    else
      $('#product_brand_id').html(state_empty)
