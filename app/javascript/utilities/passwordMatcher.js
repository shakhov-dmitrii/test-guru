document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#user_password_confirmation');

  if (control) { control.addEventListener('keyup', match); }
})

function match() {
  var password = document.querySelector('#user_password');
  var confirmationPassword  = document.querySelector('#user_password_confirmation');

  if (password.value === confirmationPassword.value ) {
    document.querySelector('.octicon-x').classList.add('hide')
  } else {
    document.querySelector('.octicon-x').classList.remove('hide');
  }
}
