# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('body').on 'click', '#companies th a, #companies .pagination a', ->
    $.getScript @href
    false
  $('#companies_search input').keyup ->
    $.get $('#companies_search').attr('action'), $('#companies_search').serialize(), null, 'script'
    newurlcsv = $('#linkcsv').val() + '&search=' + $('#search_field').val()
    $('#companies_csv').attr 'href', newurlcsv
    newurlxls = $('#linkxls').val() + '&search=' + $('#search_field').val()
    $('#companies_xls').attr 'href', newurlxls
    false
  
$('#search input').on 'click', ->
    $.get $('#companies_search').attr('action'), $('#companies_search').serialize(), null, 'script'
    newurlcsv = $('#linkcsv').val() + '&search=' + $('#search_field').val()
    $('#companies_csv').attr 'href', newurlcsv
    newurlxls = $('#linkxls').val() + '&search=' + $('#search_field').val()
    $('#companies_xls').attr 'href', newurlxls
    false
  
 
  return