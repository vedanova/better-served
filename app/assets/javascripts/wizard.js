var StartWizard = can.Control.extend({}, {
    wizard: null,

    init: function (element, options) {
        this.setupWizard();
    },
    setupWizard: function () {
        var self = this;
        this.wizard = $('#fuelux-wizard');
        var $validation = true;
        $('#fuelux-wizard').ace_wizard().on('change',function (e, info) {
            if (info.step == 1 && $validation) {
                if (!$('#premise_name').valid()) return false;
            }
            if (info.step == 2 && $validation) {
                if (!$('#premise_places_attributes_0_name').valid()) return false;
            }
            if (info.step == 3 && $validation) {
                if (!$('#premise_places_attributes_0_items_name').valid()) return false;
                self.updateWizardSummary();
            }
        }).on('finished',function (el, ev) {
            $.ajax();
            console.log(el);
            var form = $('#new_premise');
            var data = form.serialize();
            console.log(form.attr('action'));
            $.ajax({
                type: 'POST',
                url: form.attr('action'),
                data: data,
                beforeSend: function () {

                },
                success: function (data) {
                    var place_id = data.id;
                    window.location.href = "/places/" + place_id + "/items";
                },
                error: function (jqXHR, status, errorThrown) {

                },
                complete: function () {

                }
            });
//            bootbox.dialog({
//                message: "Thank you! Your information was successfully saved!",
//                buttons: {
//                    "success": {
//                        "label": "OK",
//                        "className": "btn-sm btn-primary"
//                    }
//                }
//            });
        }).on('stepclick', function (e) {
            //return false;//prevent clicking on steps
        });
    },
    /**
     * Wizard summary page
     */
    updateWizardSummary: function () {
        var premiseName = $('#premise_name').val();
        var placeName = $('#premise_places_attributes_0_name').val();
        var itemName = $('#premise_places_attributes_0_items_name').val();
        var itemCount = $('#premise_places_attributes_0_items_item_count').val();
        $('#premise-name').text(premiseName);
        $('#place-name').text(placeName);
        $('#item-name').text(itemName);
        $('#item-count').text(itemCount);
    }


})


$(function () {
    if ($('#start-wizard').length == 1) {
        startWizard = new StartWizard("#start-wizard", {})
    }
})