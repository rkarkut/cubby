# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('input#link_url').on 'change', ->
    console.log('sdf')
    $.ajax
      url: '/index/get-details'
      type: 'GET'
      data: {domain: $('input#link_url').val()}
      success: (data) ->
        $('textarea#link_description').val(data.desc)
        $('input#link_title').val(data.title)

      error: ->
        console.log 'something goes wrong'

  $('a#edit-links').on 'click', ->
    if($('div.links').css('display') == 'none')
      $('div.links').show();
      $('div.links-edit').hide();
      $(this).text('Edit links');
    else
      $('div.links').hide();
      $('div.links-edit').show();
      $(this).text('Show links');

  $('.post .favorite').on 'click', ->
    that = this
    $.ajax
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      url: '/favorites'
      type: 'POST'
      data: {link_id: $(this).data('id')}
      success: (data) ->
        $(that).html data[0].text + ' <span class="i fa fa-star-o"></span>'
        $(that).addClass 'saved'

      error: ->
        console.log 'something goes wrong'
    return false