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
      console.log("showing")
    } else {
      makeOtherField.hide();
      console.log("hiding");
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
      var requiredInputs = ["inquiry_name", "inquiry_phone", "inquiry_email", "inquiry_make", "inquiry_year", "inquiry_model", "inquiry_database", "inquiry_inquiry_type"];
      
      var selectedType = $("#inquiry_inquiry_type").val()

      if (selectedType === "Missing Information"){
        requiredInputs = requiredInputs.concat(["inquiry_missing_issue_summary","inquiry_missing_suggested_action"])
      } else if (selectedType === "Parts"){
        requiredInputs = requiredInputs.concat(["inquiry_parts_issue_summary","inquiry_parts_suggested_action"])
      } else if (selectedType === "Procedure Page Issue"){
        requiredInputs = requiredInputs.concat(["inquiry_procedure_issue_summary","inquiry_procedure_suggested_action"])
      } else if (selectedType === "Welded Panel Operations"){
        requiredInputs = requiredInputs.concat(["inquiry_welded_issue_summary","inquiry_welded_suggested_action"])
      } else if (selectedType === "Non-Welded Panel Operations"){
        requiredInputs = requiredInputs.concat(["inquiry_non_welded_issue_summary","inquiry_non_welded_suggested_action"])
      } else if (selectedType === "Refinish Operations"){
        requiredInputs = requiredInputs.concat(["inquiry_refinished_issue_summary","inquiry_refinished_suggested_action"])
      } else if (selectedType === "All Other"){
        requiredInputs = requiredInputs.concat(["inquiry_all_other_issue_summary","inquiry_all_other_suggested_action"])
      }

      for (var i in requiredInputs) {
        if (($('#' + requiredInputs[i]).val().trim() === '')) {
          return '#' + requiredInputs[i]
        }
      }
      return ""
  },

  requiredIfTypeIs: function(inquiry_type){
      var selectedType = $("#inquiry_inquiry_type").val()
        if (selectedType === inquiry_type) {
          return true
        } else {
          return false 
        }
    },

  checkRequiredFields: function() {
    jQuery.validator.addMethod("notEqual", function(value, element, param) {
      return this.optional(element) || value != param;
      }, "Please specify a different (non-default) value");

    $("form").validate({
      rules: {
        "inquiry[name]": {required: true},
        "inquiry[phone]": {required: true, phoneUS: true},
        "inquiry[email]": {required: true, email: true, equalTo: "#verify_email"},
        "inquiry[make]": {required: true, nowhitespace: true},
        "inquiry[model]": {required: true},
        "inquiry[year]": {required: true, nowhitespace: true},
        "inquiry[database]": {required: true, nowhitespace: true},
        "inquiry[inquiry_type]": {required: true, notEqual: " "},
        "verify_email": {required: true},
        "inquiry[missing_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("Missing Information")}
        },
        "inquiry[missing_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("Missing Information")}
        },
        "inquiry[parts_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("Parts")}
        },
        "inquiry[parts_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("Parts")}
        },
        "inquiry[procedure_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("Procedure Page Issue")}
        },
        "inquiry[procedure_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("Procedure Page Issue")}
        },
        "inquiry[welded_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("Welded Panel Operations")}
        },
        "inquiry[welded_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("Welded Panel Operations")}
        },
        "inquiry[non_welded_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("Non-Welded Panel Operations")}
        },
        "inquiry[non_welded_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("Non-Welded Panel Operations")}
        },
        "inquiry[refinished_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("Refinish Operations")}
        },
        "inquiry[refinished_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("Refinish Operations")}
        },
        "inquiry[all_other_issue_summary]": {required: function(){
          return Forms.requiredIfTypeIs("All Other")}
        },
        "inquiry[all_other_suggested_action]": {required: function(){
          return Forms.requiredIfTypeIs("All Other")}
        }
      },
      messages: {
        "inquiry[name]": {required: "enter a name"},
        "inquiry[phone]": {required: "enter a phone number", phoneUS: "enter a valid phone number"},
        "inquiry[email]": {required: "enter an email", email: "enter a valid email", equalTo: "please verify email"},
        "inquiry[make]": {required: "select a make", nowhitespace: "select a make"},
        "inquiry[model]": {required: "enter a model"},
        "inquiry[year]": {required: "select a year", nowhitespace: "select a year"},
        "inquiry[database]": {required: "select a database", nowhitespace: "select a database"},
        "inquiry[inquiry_type]": {required: "select an inquiry type", notEqual: "select an inquiry type"},
        "inquiry[missing_issue_summary]": {required: "enter an issue summary"},
        "inquiry[missing_suggested_action]": { required: "enter a suggested action"}
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
        $('#inquiry_attachment').focus();
        $('html, body').animate({ scrollTop: $('#title').offset().top }, 'fast')
      }
    });

    $(".form-back-button").click(function(event){
      event.preventDefault();
      $(".section-1").show();
      $(".section-2").hide();
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