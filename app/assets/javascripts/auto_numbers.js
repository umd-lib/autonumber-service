/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

$(function() {
  // source: http://stackoverflow.com/a/30810322/5124907
  var copyTextareaBtn = document.querySelector('#copy-button');

  copyTextareaBtn.addEventListener('click', function(event) {
    var copyTextarea = document.querySelector('#copy-text');
    copyTextarea.select();

    try {
      var successful = document.execCommand('copy');
      var msg = successful ? 'successful' : 'unsuccessful';
      console.log('Copying text command was ' + msg);
    } catch (err) {
      console.log('Oops, unable to copy');
    }
  });
});
