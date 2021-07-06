# clean up from previous error messages
$('#seminar_title_id').removeClass('is-invalid')
$('#new-seminar-title-error').empty()
$('#seminar_term_id').removeClass('is-invalid')
$('#new-seminar-term-error').empty()
$('#seminar_course').removeClass('is-invalid')
$('#new-seminar-course-error').empty()

# display error message
<% if @errors.present? %>
<% if @errors[:title].present? %>
$('#new-seminar-title-error')
  .append('<%= @errors[:title].join(" ") %>').show()
$('#seminar_title_id').addClass('is-invalid')
<% end %>
<% if @errors[:term].present? %>
$('#new-seminar-term-error')
  .append('<%= @errors[:term].join(" ") %>').show()
$('#seminar_term_id').addClass('is-invalid')
<% end %>
<% if @errors[:course].present? %>
$('#new-seminar-course-error')
  .append('<%= @errors[:course].join(" ") %>').show()
$('#seminar_course').addClass('is-invalid')
<% end %>
<% end %>
