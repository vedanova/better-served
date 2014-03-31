var StartWizard = can.Control.extend({}, {
    wizard: null,

    init: function (element, options) {
        this.setupWizard();
    },
    setupWizard: function () {
        this.wizard = $('#fuelux-wizard');
        var $validation = true;
        $('#fuelux-wizard').ace_wizard().on('change' , function(e, info){
            if(info.step == 1 && $validation) {
                if(!$('#new_premise').valid()) return false;
            }
        }).on('finished', function(e) {
            bootbox.dialog({
                message: "Thank you! Your information was successfully saved!",
                buttons: {
                    "success" : {
                        "label" : "OK",
                        "className" : "btn-sm btn-primary"
                    }
                }
            });
        }).on('stepclick', function(e){
            //return false;//prevent clicking on steps
        });


    }


})


$(function () {
    if ($('#start-wizard').length == 1) {
        startWizard = new StartWizard("#start-wizard", {})
    }
})