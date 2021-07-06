$(document).on 'turbolinks:load', ->

  # disable active state for menu entries when submenus are triggered
  $('.dropdown-submenu > a').on 'click', (e) ->
    submenu = $(this)
    $('.dropdown-submenu .dropdown-menu').removeClass 'show'
    submenu.next('.dropdown-menu').addClass 'show'
    e.stopPropagation()
    return

  # hide any open menus when parent closes
  $('.dropdown').on 'hidden.bs.dropdown', ->
    $('.dropdown-menu.show').removeClass 'show'
    return

  $('#new-course-button').on 'click', ->
    $('#new-course-area').show()
    $('.admin-index-button').hide()
    return

  $('#cancel-new-course').on 'click', ->
    $('#new-course-area').hide()
    $('#new-course-button').show()
    $('.admin-index-button').show()
    return

  $(document).on 'click', '#cancel-new-seminar', ->
    if $('#course_preceding_course_ids').length == 1
      location.reload(true)
    else
      $('#new-seminar-area').empty().hide()
      $('.admin-index-button').show()
    return

  $(document).on 'change', '#seminar_course_id', ->
    $('#seminar_term_id').removeClass('is-invalid')
    $('#new-seminar-term-error').empty()
    $('#seminar_title').removeClass('is-invalid')
    $('#new-seminar-title-error').empty()
    $('#seminar_course_id').removeClass('is-invalid')
    $('#new-seminar-course-error').empty()
    courseId = parseInt($(this).val())
    termInfo = $(this).data('terminfo').filter (x) -> x[0] == courseId
    console.log termInfo[0]
    if termInfo[0][1]
      $('#newSeminarTerm').hide()
      $('#seminar_term_id').prop('disabled', true)
      $('#newSeminarSort').hide()
    else
      $('#newSeminarTerm').show()
      $('#seminar_term_id').prop('disabled', false)
      $('#newSeminarSort').show()
    return


# clean up everything before turbolinks caches
$(document).on 'turbolinks:before-cache', ->
  $(document).off 'click', '#cancel-new-seminar'
return
