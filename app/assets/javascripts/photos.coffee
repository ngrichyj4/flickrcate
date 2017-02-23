# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $(".form-search").on("ajax:success", (e, data, status, xhr) ->
    keyword = $('input[name=keyword]').val()
    $(".photos").html xhr.responseText
    $('button').html 'Search'
    $(".photos").pageless(
      totalPage: 20, 
      url: '/photos/search/'+'?keyword='+keyword, 
      method: 'post', 
      loaderMsg: 'Getting more photos', 
      loaderImage: gon.loader
    )
  )

  $(document).on 'click', 'button', ->
    $('button').html 'Loading...'