$ -> 
  $('a[data-toggle="tooltip"]').tooltip()

  $('a.add_new_link').on 'click', ->

      #$('.add_category_box').hide();    

    if($('.add_link_box').css('display') == 'none')
      $('.add_link_box').show();
    else
      $('.add_link_box').hide();
  
  $('a.add_new_category').on 'click', ->
    
      #$('.add_link_box').hide();    

    if($('.add_category_box').css('display') == 'none')
      $('.add_category_box').show();
    else
      $('.add_category_box').hide();
 

  $('.btn_add_link').on 'click', ->

    form_url    = $('#new_link_url');
    form_title  = $('#new_link_title');
    form_desc   = $('#new_link_desctiption');

    if(form_url.val() == '')
      return

  $('input#new_link_url').on 'change', ->

    $.ajax
      url: '/index/get-details'
      type: 'GET'
      data: {domain: $('input#new_link_url').val()}
      success: (data) ->
      
        $('input#new_link_title').val(data.title)
        $('textarea#new_link_description').val(data.desc)

      error: ->
        console.log 'something goes wrong'

  $('a.box_close').on 'click', ->
    $(this).parent().parent().hide();
