var Forms = {
  getElements: function() {
    this.el = {};
    this.el.formField = $(document.querySelector('.form-field'));
  },

  toggleVechicleAreaField: function(prefix) {
    var value = $("select#inquiry_" + prefix + "_area_of_vechicle").val();
    var areaOfVechicleOtherField = $("input#inquiry_"+prefix+"_area_of_vechicle_other_field");
    var other = "Other";
    if (value === other) {
      areaOfVechicleOtherField.show();
    } else {
      areaOfVechicleOtherField.hide();
    }
  },

  toggleOtherMakeField: function() {
    var value = $("select#inquiry_make").val();
    var makeOtherField = $("input#inquiry_make_other_field");
    var other = "Other";
    if (value === other) {
      makeOtherField.show();
    } else {
      makeOtherField.hide();
    }
  },

  initOtherAreaVechicleField: function(prefix) {
    this.toggleVechicleAreaField(prefix);
    $("select#inquiry_" + prefix + "_area_of_vechicle").change(function(){
      Forms.toggleVechicleAreaField(prefix);
    });
  },

  initDynamicForms: function() {
    $("select#inquiry_make").change(function(){
      Forms.toggleOtherMakeField();
    });

    $("select#inquiry_inquiry_type").change(function(){
      var value = $(this).val();
      var missingInfo = "Missing Information";
      var missingInfoPrefix = "missing";
      var parts = "Parts";
      var partsPrefix = "parts";
      var procedurePage = "Procedure Page Issue";
      var procedurePagePrefix = "procedure";
      var weldedPanelOperations = "Welded Panel Operations";
      var weldedPanelOperationsPrefix = "welded";
      var nonWeldedPanelOperations = "Non-Welded Panel Operations";
      var nonWeldedPanelOperationsPrefix = "non_welded";
      var refinishedOperations = "Refinish Operations";
      var refinishedOperationsPrefix = "refinished";
      var allOther = "All Other";
      var select = " ";

      if (value === select) {
        Forms.hideDatabaseForms();
      } else if (value === missingInfo) {
        Forms.hideDatabaseForms();
        $(".missing-info-form").show();
        Forms.initOtherAreaVechicleField(missingInfoPrefix);
      } else if (value === parts) {
        Forms.hideDatabaseForms();
        $(".parts-form").show();
        Forms.initOtherAreaVechicleField(partsPrefix);
      } else if (value === procedurePage) {
        Forms.hideDatabaseForms();
        $(".procedure-page-form").show();
        Forms.initOtherAreaVechicleField(procedurePagePrefix);
      } else if (value === weldedPanelOperations) {
        Forms.hideDatabaseForms();
        $(".welded-panel-operations-form").show();
        Forms.initOtherAreaVechicleField(weldedPanelOperationsPrefix);
      } else if (value === nonWeldedPanelOperations) {
        Forms.hideDatabaseForms();
        $(".non-welded-panel-operations-form").show();
        Forms.initOtherAreaVechicleField(nonWeldedPanelOperationsPrefix);
      } else if (value === refinishedOperations) {
        Forms.hideDatabaseForms();
        $(".refinished-operations-form").show();
        Forms.initOtherAreaVechicleField(refinishedOperationsPrefix);
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
    this.toggleOtherMakeField();
  },

  init: function() {
    this.getElements();
    if (this.el.formField.length !== 0) {
      this.hideDatabaseForms();
      this.toggleOtherMakeField();
      this.initDynamicForms();
    }
  }
};