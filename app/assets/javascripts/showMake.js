var ShowMake = {
  getElements: function() {
    this.el = {};
    this.el.showMakeForm = $(document.querySelector('.show-make-form'));
    this.el.vehicleEditForm = $(document.querySelector('.vehicle-edit-form'));
  },

  hideEditForms: function() {
    $("#resolution-form").hide();
    $(".customer-detail-form").hide();
    $("#vehicle-form").hide();
    $('.inquiry-form').hide();
  },

  toggleFormsOnClick: function() {
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
      $(".customer-detail-data").toggle();
      $(".customer-detail-form").toggle();
    });

    $("#customer-submit").click(function(event) {
      $("#resolution-form").toggle();
      $("#resolution-text").toggle();
    });

    $("#customer-cancel").click(function(event) {
      $("#resolution-form").toggle();
      $("#resolution-text").toggle();
    });

    $("#vehicle-edit").click(function(event) {
      $("#vehicle-info").toggle();
      $("#vehicle-form").toggle();
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

  initDynamicForms: function() {
    $("select#inquiry_make").change(function(){
      ShowMake.toggleOtherMakeField();
    });
  },

  // validateRequiredFields: function(formType, requiredInputs) {
  //   $('.' + formType + '-required-input').on('keydown mouseup', function() {
  //     var hasAllrequiredInputs;
  //     var hasRequiredInputsArray = [];
  //     for (var i in requiredInputs) {
  //       var hasContent = false;
  //       if (($('#' + requiredInputs[i]).val().trim() !== '')) {
  //         hasContent = true;
  //       }
  //       hasRequiredInputsArray.push(hasContent);
  //     }

  //     hasAllrequiredInputs = hasRequiredInputsArray.every(Boolean);

  //     if (hasAllrequiredInputs) {
  //       $('input.' + formType + '-edit-form').removeAttr('disabled');
  //     } else {
  //       $('input.' + formType + '-edit-form').attr('disabled', 'disabled');
  //     }
  //   });
  // },

  checkRequiredFields: function() {
    $("form").validate({
      rules: {
        "inquiry[name]": {required: true},
        "inquiry[phone]": {required: true, phoneUS: true},
        "inquiry[email]": {required: true, email: true},
        "inquiry[make]": {required: true, nowhitespace: true},
        "inquiry[model]": {required: true},
        "inquiry[year]": {required: true, nowhitespace: true},
        "inquiry[vin]": {required: true, minlength: 17, maxlength: 17}
      },
      messages: {
        "inquiry[name]": {required: "enter a name"},
        "inquiry[phone]": {required: "enter a phone number", phoneUS: "enter a valid phone number"},
        "inquiry[email]": {required: "enter an email", email: "enter a valid email"},
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
      if (this.el.vehicleEditForm.length !== 0) {
        this.toggleOtherMakeField();
        this.initDynamicForms();
      }
      this.checkRequiredFields();
    }
  }
};