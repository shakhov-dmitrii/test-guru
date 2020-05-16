document.addEventListener('turbolinks:load', function() {
  var control1 = document.querySelector('#user_password');
  var control2 = document.querySelector('#user_password_confirmation');

  if (control1 && control2) { 
    control1.addEventListener('keyup', match); 
    control2.addEventListener('keyup', match); 
  }
})

function match() {
  var password = document.querySelector('#user_password');
  var confirmationPassword  = document.querySelector('#user_password_confirmation');

  if (password.value === "" || confirmationPassword.value === "") {
    document.querySelector('.octicon-x').classList.add('hide');
    return;
  } 
  
  if (password.value === confirmationPassword.value ) {
    document.querySelector('.octicon-x').classList.add('hide');
  } else {
    document.querySelector('.octicon-x').classList.remove('hide');
  }
}
