var ShowMake = {
  getElements: function() {
    this.el = {};
    this.constants = {};
    this.el.showMakeForm = $(document.querySelector('.show-make-form'));
    this.constants.missingInfo = "Missing Information";
    this.constants.missingInfoPrefix = "missing";
    this.constants.parts = "Parts";
    this.constants.partsPrefix = "parts";
    this.constants.procedurePage = "Procedure Page Issue";
    this.constants.procedurePagePrefix = "procedure";
    this.constants.weldedPanelOperations = "Welded Panel Operations";
    this.constants.weldedPanelOperationsPrefix = "welded";
    this.constants.nonWeldedPanelOperations = "Non-Welded Panel Operations";
    this.constants.nonWeldedPanelOperationsPrefix = "non_welded";
    this.constants.refinishedOperations = "Refinish Operations";
    this.constants.refinishedOperationsPrefix = "refinished";
    this.constants.allOther = "All Other";
    this.constants.select = " ";
  },

  hideEditForms: function() {
    $("#status-form").hide();
    $("#resolution-form").hide();
    $(".customer-detail-form").hide();
    $("#vehicle-form").hide();
    $('.inquiry-form').hide();
  },

  toggleFormsOnClick: function() {
    $("#status-edit").click(function(event){
      $("#status-form").toggle();
      $("#status-text").toggle();
    });

    $("#resolution-edit").click(function(event) {
      var currentResolution = $("#resolution-text").find("p").text();
      $("textArea").text(currentResolution);
      $("textArea").focus();
      $("#resolution-text").toggle();
      $("#resolution-form").toggle();
    });

    $("#resolution-submit").click(function(event) {
      var newResolution = $("#textArea").val();
      $("#resolution-text").find("p").text(newResolution);
      $("#resolution-form").toggle();
      $("#resolution-text").toggle();
    });

    $("#resolution-cancel").click(function(event) {
      $("#resolution-form").toggle();
      $("#resolution-text").toggle();
    });

    $("#customer-edit").click(function(event) {
      ShowMake.el.customerEditForm = $(document.querySelector('.customer-edit-form'));
      $(".customer-detail-data").toggle();
      $(".customer-detail-form").toggle();
      ShowMake.checkRequiredCustomerFields();
    });

    $("#customer-submit").click(function(event) {
      $(".customer-detail-data").toggle();
      $(".customer-detail-form").toggle();
    });

    $("#customer-cancel").click(function(event) {
      $(".customer-detail-data").toggle();
      $(".customer-detail-form").toggle();
    });

    $("#vehicle-edit").click(function(event) {
      ShowMake.el.vehicleEditForm = $(document.querySelector('.vehicle-edit-form'));
      $("#vehicle-info").toggle();
      $("#vehicle-form").toggle();
      if (ShowMake.el.vehicleEditForm.length !== 0) {
        ShowMake.toggleOtherMakeField();
        ShowMake.initDynamicMakeForms();
      }
      ShowMake.checkRequiredVehicleFields();
    });

    $("#vehicle-submit").click(function(event) {
      $("#vehicle-form").toggle();
      $("#vehicle-info").toggle();
    });

    $("#resolution-cancel").click(function(event) {
      $("#resolution-form").toggle();
      $("#resolution-text").toggle();
    });

    $('#inquiry-edit').click(function(event){
      var value = $("select#inquiry_inquiry_type").val();
      ShowMake.el.inquiryEditForm = $(document.querySelector('.inquiry-edit-form'));
      $('.inquiry-form').toggle();
      $('.inquiry-data').toggle();
      if (ShowMake.el.inquiryEditForm.length !== 0) {
        ShowMake.initDynamicInquiryTypeForms(value);
        ShowMake.changeInquiryType();
      }
    });

    $('#inquiry-submit').click(function(event){
      ShowMake.el.vehicleEditForm = $(document.querySelector('.vehicle-edit-form'));
      $('.inquiry-form').toggle();
      $('.inquiry-data').toggle();
    });
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
      ShowMake.toggleVehicleAreaField(prefix);
    });
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

  hideInquiryDatabaseForms: function() {
    $(".missing-info-form").hide();
    $(".parts-form").hide();
    $(".procedure-page-form").hide();
    $(".welded-panel-operations-form").hide();
    $(".non-welded-panel-operations-form").hide();
    $(".refinished-operations-form").hide();
    $(".all-other-form").hide();
  },

  initDynamicMakeForms: function() {
    $("select#inquiry_make").change(function(){
      ShowMake.toggleOtherMakeField();
    });
  },

  initDynamicInquiryTypeForms: function(value) {
    if (value === this.constants.select) {
      ShowMake.hideInquiryDatabaseForms();
    } else if (value === this.constants.missingInfo) {
      ShowMake.hideInquiryDatabaseForms();
      $(".missing-info-form").show('slow');
      ShowMake.initOtherAreaVehicleField(this.constants.missingInfoPrefix);
    } else if (value === this.constants.parts) {
      ShowMake.hideInquiryDatabaseForms();
      $(".parts-form").show('slow');
      ShowMake.initOtherAreaVehicleField(this.constants.partsPrefix);
    } else if (value === this.constants.procedurePage) {
      ShowMake.hideInquiryDatabaseForms();
      $(".procedure-page-form").show('slow');
      ShowMake.initOtherAreaVehicleField(this.constants.procedurePagePrefix);
    } else if (value === this.constants.weldedPanelOperations) {
      ShowMake.hideInquiryDatabaseForms();
      $(".welded-panel-operations-form").show('slow');
      ShowMake.initOtherAreaVehicleField(this.constants.weldedPanelOperationsPrefix);
    } else if (value === this.constants.nonWeldedPanelOperations) {
      ShowMake.hideInquiryDatabaseForms();
      $(".non-welded-panel-operations-form").show('slow');
      ShowMake.initOtherAreaVehicleField(this.constants.nonWeldedPanelOperationsPrefix);
    } else if (value === this.constants.refinishedOperations) {
      ShowMake.hideInquiryDatabaseForms();
      $(".refinished-operations-form").show('slow');
      ShowMake.initOtherAreaVehicleField(this.constants.refinishedOperationsPrefix);
    } else if (value === this.constants.allOther) {
      ShowMake.hideInquiryDatabaseForms();
      $(".all-other-form").show('slow');
      ShowMake.initOtherAreaVehicleField();
    }
  },

  changeInquiryType: function() {
    $("select#inquiry_inquiry_type").change(function() {
      var value = $(this).val();
      ShowMake.initDynamicInquiryTypeForms(value);
    });
  },

  checkRequiredCustomerFields: function() {
    $(".customer-edit-form").validate({
      rules: {
        "inquiry[name]": {required: true},
        "inquiry[phone]": {required: true, phoneUS: true},
        "inquiry[email]": {required: true, email: true},
      },
      messages: {
        "inquiry[name]": {required: "enter a name"},
        "inquiry[phone]": {required: "enter a phone number", phoneUS: "enter a valid phone number"},
        "inquiry[email]": {required: "enter an email", email: "enter a valid email"},
      }
    });
  },

  checkRequiredVehicleFields: function() {
    $(".vehicle-edit-form").validate({
      rules: {
        "inquiry[make]": {required: true, nowhitespace: true},
        "inquiry[model]": {required: true},
        "inquiry[year]": {required: true, nowhitespace: true},
        "inquiry[vin]": {required: true, minlength: 17, maxlength: 17}
      },
      messages: {
        "inquiry[make]": {required: "select a make", nowhitespace: "select a make"},
        "inquiry[model]": {required: "enter a model"},
        "inquiry[year]": {required: "select a year", nowhitespace: "select a year"},
        "inquiry[vin]": {required: "enter a vin", minlength: "enter a valid 17 character VIN", maxlength: "enter a valid 17 character VIN"}
      }
    });
  },

  init: function() {
    this.getElements();
    if (this.el.showMakeForm.length !== 0) {
      this.hideEditForms();
      this.toggleFormsOnClick();
    }
  }
};