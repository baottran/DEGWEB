var Forms = {
  getElements: function() {
    this.el = {};
    this.el.formField = $(document.querySelector('.form-field'));
  },

  hideVechicleAreaField: function() {
    $("input#inquiry_area_of_vechicle_other_field").hide();
  },

  hideOtherMakeField: function() {
    $("input#inquiry_make_other_field").hide();
  },

  initOtherAreaVechicleField: function() {
    $("select#inquiry_area_of_vechicle").change(function(){
      var value = $(this).val();
      var other = "Other";
      if (value === other) {
        $("#inquiry_area_of_vechicle_other_field").show();
      } else {
        Forms.hideVechicleAreaField();
      }
    });
  },

  initDynamicForms: function() {
    $("select#inquiry_make").change(function(){
      var value = $(this).val();
      var other = "Other";
      if (value === other) {
        $("#inquiry_make_other_field").show();
      } else {
        Forms.hideOtherMakeField();
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
        Forms.hideDatabaseForms();
      } else if (value === missingInfo) {
        Forms.hideDatabaseForms();
        $(".missing-info-form").show();
        Forms.initOtherAreaVechicleField();
      } else if (value === parts) {
        Forms.hideDatabaseForms();
        $(".parts-form").show();
        Forms.initOtherAreaVechicleField();
      } else if (value === procedurePage) {
        Forms.hideDatabaseForms();
        $(".procedure-page-form").show();
        Forms.initOtherAreaVechicleField();
      } else if (value === weldedPanelOperations) {
        Forms.hideDatabaseForms();
        $(".welded-panel-operations-form").show();
        Forms.initOtherAreaVechicleField();
      } else if (value === nonWeldedPanelOperations) {
        Forms.hideDatabaseForms();
        $(".non-welded-panel-operations-form").show();
        Forms.initOtherAreaVechicleField();
      } else if (value === refinishedOperations) {
        Forms.hideDatabaseForms();
        $(".refinished-operations-form").show();
        Forms.initOtherAreaVechicleField();
      } else if (value === allOther) {
        Forms.hideDatabaseForms();
        $(".all-other-form").show();
        Forms.initOtherAreaVechicleField();
      }
    });
  },

  hideDatabaseForms: function() {
    $(".missing-info-form").hide();
    $(".parts-form").hide();
    $(".procedure-page-form").hide();
    $(".welded-panel-operations-form").hide();
    $(".non-welded-panel-operations-form").hide();
    $(".refinished-operations-form").hide();
    $(".all-other-form").hide();
    this.hideVechicleAreaField();
  },

  init: function() {
    this.getElements();
    if (this.el.formField.length !== 0) {
      this.hideDatabaseForms();
      this.hideOtherMakeField();
      this.initDynamicForms();
    }
  }
};