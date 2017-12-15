$(document).ready(function() {
  $("#mailgun_mail_submit_action input").attr("value","Отправить емейл");;

  $('#mailgun_mail_multiple_emails').on( 'click', function(e) {
    $('#mailgun_mail_sent_to_input').toggleClass('hidden');
  });
});
