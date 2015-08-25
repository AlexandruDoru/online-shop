$(function() {
  $('#document_content').wysihtml5();

  $('.main-category-dynamic').on('change', function() {
  	$('.main-category-dynamic-field').val($('.main-category-dynamic').val()).parents('form').submit();
  });

  $('#since_when').datepicker({format: 'dd/mm/yyyy'});
  $('#until_when').datepicker({format: 'dd/mm/yyyy'});

});