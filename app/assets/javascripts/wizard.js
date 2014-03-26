var StartWizard = can.Control.extend({}, {
    wizard: null,

    init: function (element, options) {
        this.setupWizard();
    },
    setupWizard: function () {
        this.wizard = $('#fuelux-wizard');
        var self = this,
            $btnPrev = $('.wizard-actions .btn-prev'),
            $btnNext = $('.wizard-actions .btn-next'),
            $btnFinish = $(".wizard-actions .btn-finish");

    }


})

if ($('#start-wizard').length == 1) {
    var wizard = new StartWizard("#start-wizard", {})
}