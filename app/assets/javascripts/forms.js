var Forms = {
  getElements: function() {
    this.el = {};
    this.el.formField = $(document.querySelector('.form-field'));
  },

  toggleVehicleAreaField: function(prefix) {
    var value = $("select#inquiry_" + prefix + "_area_of_vehicle").val();
    var areaOfVehicleOtherField = $("input#inquiry_"+prefix+"_area_of_vehicle_other_field");
    var other = "Other";
    if (value === other) {
      areaOfVehicleOtherField.show('slow');
    } else {
      areaOfVehicleOtherField.hide();
    }
  },

  toggleOtherMakeField: function() {
    var value = $("select#inquiry_make").val();
    var makeOtherField = $("input#inquiry_make_other_field");
    var other = "Other";
    if (value === other) {
      makeOtherField.show('slow');
    } else {
      makeOtherField.hide();
    }
  },

  initOtherAreaVehicleField: function(prefix) {
    this.toggleVehicleAreaField(prefix);
    $("select#inquiry_" + prefix + "_area_of_vehicle").change(function(){
      Forms.toggleVehicleAreaField(prefix);
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
        $(".missing-info-form").show('slow');
        Forms.initOtherAreaVehicleField(missingInfoPrefix);
      } else if (value === parts) {
        Forms.hideDatabaseForms();
        $(".parts-form").show('slow');
        Forms.initOtherAreaVehicleField(partsPrefix);
      } else if (value === procedurePage) {
        Forms.hideDatabaseForms();
        $(".procedure-page-form").show('slow');
        Forms.initOtherAreaVehicleField(procedurePagePrefix);
      } else if (value === weldedPanelOperations) {
        Forms.hideDatabaseForms();
        $(".welded-panel-operations-form").show('slow');
        Forms.initOtherAreaVehicleField(weldedPanelOperationsPrefix);
      } else if (value === nonWeldedPanelOperations) {
        Forms.hideDatabaseForms();
        $(".non-welded-panel-operations-form").show('slow');
        Forms.initOtherAreaVehicleField(nonWeldedPanelOperationsPrefix);
      } else if (value === refinishedOperations) {
        Forms.hideDatabaseForms();
        $(".refinished-operations-form").show('slow');
        Forms.initOtherAreaVehicleField(refinishedOperationsPrefix);
      } else if (value === allOther) {
        Forms.hideDatabaseForms();
        $(".all-other-form").show('slow');
        Forms.initOtherAreaVehicleField();
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

  missingFieldToFocus: function(){
      var requiredInputs = ["inquiry_name", "inquiry_phone", "inquiry_email", "inquiry_make", "inquiry_year", "inquiry_model"];
      for (var i in requiredInputs) {
        if (($('#' + requiredInputs[i]).val().trim() === '')) {
          return '#' + requiredInputs[i]
        }
      }
      return ""
  },

  checkRequiredFields: function() {
    $("form").validate({
      rules: {
        "inquiry[name]": {required: true},
        "inquiry[phone]": {required: true, phoneUS: true},
        "inquiry[email]": {required: true, email: true},
        "inquiry[make]": {required: true, nowhitespace: true},
        "inquiry[model]": {required: true},
        "inquiry[year]": {required: true, nowhitespace: true}
      },
      messages: {
        "inquiry[name]": {required: "enter a name"},
        "inquiry[phone]": {required: "enter a phone number", phoneUS: "enter a valid phone number"},
        "inquiry[email]": {required: "enter an email", email: "enter a valid email"},
        "inquiry[make]": {required: "select a make", nowhitespace: "select a make"},
        "inquiry[model]": {required: "enter a model"},
        "inquiry[year]": {required: "select a year", nowhitespace: "select a year"}
      }
    });
  },


  toggleAddFileForm: function(){
    $(".section-2").hide();
    $(".form-next-button").click(function(event){

      if(Forms.missingFieldToFocus() !== ""){
        console.log("does not have all required inputs. missing ", Forms.missingFieldToFocus());
        $(Forms.missingFieldToFocus()).focus();
        $("form").validate().element(Forms.missingFieldToFocus());
      } else {
        console.log("not disabled")
        event.preventDefault();
        $(".section-1").hide();
        $(".section-2").show();
        $(document).scrollTop(0);
        $(".section-2").focus();

      }
    });

    $(".form-back-button").click(function(event){
      event.preventDefault();
      $(".section-1").show();
      $(".section-2").hide();
      // $(document).scrollTop(0);
      $(".section-1").focus();
    });
  },

  init: function() {
    this.getElements();
    if (this.el.formField.length !== 0) {
      this.hideDatabaseForms();
      this.toggleOtherMakeField();
      this.initDynamicForms();
      this.checkRequiredFields();
      this.toggleAddFileForm();
    }
  }
};