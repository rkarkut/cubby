# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('a#edit-categories').on 'click', ->
    if($('div.categories').css('display') == 'none')
      $('div.categories').show();
      $('div.categories-edit').hide();
      $(this).text('Edit categories');
    else
      $('div.categories').hide();
      $('div.categories-edit').show();
      $(this).text('Show categories');