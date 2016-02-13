// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $(".missing-info-form").hide();
  $(".parts").hide();
  $("select#inquiry_inquiry_type").change(function(){
    var value = $(this).val();
    var missingInfo = "Missing Information";
    var parts = "Parts";
    var procedurePage = "Procedure Page Issue";
    var weldedPanelOperations = "Welded Panel Operations";
    var nonWeldedPanelOperations = "Non-Welded Panel Operations";
    var refinishedOperations = "Refinish Operations";
    var allOther = "All Other";
    var select = " ";

    if (value === select) {
      $(".missing-info-form").hide();
      $(".parts").hide();
    } else if (value === missingInfo) {
      $(".parts").hide();
      $(".missing-info-form").show();
    } else if (value === parts) {
      $(".missing-info-form").hide();
      $(".parts").show();
    } else if (value === procedurePage) {
      alert(procedurePage);
    } else if (value === weldedPanelOperations) {
      alert(weldedPanelOperations);
    } else if (value === nonWeldedPanelOperations) {
      alert(nonWeldedPanelOperations);
    } else if (value === refinishedOperations) {
      alert(refinishedOperations);
    } else if (value === allOther) {
      alert(allOther);
    }
  });
});