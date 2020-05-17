document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.test-progress');
  if (progress) {
    var rate = progress.dataset.testProgress + '%';
    progress.textContent = rate;
    progress.style.width = rate;
   }
  });
