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
  hideDatabaseForms();
  hideOtherMakeField();
  initDynamicForms();

  function hideVechicleAreaField() {
    $("input#inquiry_area_of_vechicle_other_field").hide();
  }

  function hideOtherMakeField() {
    $("input#inquiry_make_other_field").hide();
  }

  function initOtherAreaVechicleField() {
    $("select#inquiry_area_of_vechicle").change(function(){
      var value = $(this).val();
      var other = "Other";
      if (value === other) {
        $("#inquiry_area_of_vechicle_other_field").show();
      } else {
        hideVechicleAreaField();
      }
    });
  }

  function initDynamicForms() {
    $("select#inquiry_make").change(function(){
      var value = $(this).val();
      var other = "Other";
      if (value === other) {
        $("#inquiry_make_other_field").show();
      } else {
        hideOtherMakeField();
      }
    });

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
        hideDatabaseForms();
      } else if (value === missingInfo) {
        hideDatabaseForms();
        $(".missing-info-form").show();
        initOtherAreaVechicleField();
      } else if (value === parts) {
        hideDatabaseForms();
        $(".parts-form").show();
        initOtherAreaVechicleField();
      } else if (value === procedurePage) {
        hideDatabaseForms();
        $(".procedure-page-form").show();
        initOtherAreaVechicleField();
      } else if (value === weldedPanelOperations) {
        hideDatabaseForms();
        $(".welded-panel-operations-form").show();
        initOtherAreaVechicleField();
      } else if (value === nonWeldedPanelOperations) {
        hideDatabaseForms();
        $(".non-welded-panel-operations-form").show();
        initOtherAreaVechicleField();
      } else if (value === refinishedOperations) {
        hideDatabaseForms();
        $(".refinished-operations-form").show();
        initOtherAreaVechicleField();
      } else if (value === allOther) {
        hideDatabaseForms();
        $(".all-other-form").show();
        initOtherAreaVechicleField();
      }
    });
  }

  function hideDatabaseForms() {
    $(".missing-info-form").hide();
    $(".parts-form").hide();
    $(".procedure-page-form").hide();
    $(".welded-panel-operations-form").hide();
    $(".non-welded-panel-operations-form").hide();
    $(".refinished-operations-form").hide();
    $(".all-other-form").hide();
    hideVechicleAreaField();
  }
});