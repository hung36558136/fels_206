// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .
//= require i18n
//= require i18n.js
//= require i18n/translations

function remove_fields(link){
  dem = getdem();
  if(dem > 2){
    if($(link).closest('.fields').find('input[type=checkbox]').is(':checked')){
      alert('No delete correct answer');
    }else{
      $(link).prev('input[type=hidden]').val('1');
      $(link).closest('.fields').hide();
    }
  }else{
    alert(I18n.t('min_number_answers'));
  }
}

function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp('new_' + association, 'g')
  dem = getdem();
  if(dem < 6){
    $('div.answers').append(content.replace(regexp, new_id));
  }
  else {
    alert(I18n.t('max_number_answers'));
  }
}

function getdem(){
  dem=0;
  $('.attachment').each(function(index){
    console.log(index)
    if($('.attachment')[index].style.display !='none'){
      dem++;
    }
  });
  return dem;
}
