(function () {
    'use strict';

    var serviceId = 'dateTimeFactory';
    angular.module('app').factory(serviceId,
      [dateTimeFactory]);

    function dateTimeFactory() {

        var service = {
            applyDatePicker: applyDatePicker
        };
        return service;

        /**
         * @name enableDisableBtn
         * @desc Gets called when any checkbox is selected, enables or disables the button
         * @param itemList, model, showBtn, disableBtn
         * @returns none
         */
        function applyDatePicker() {
            $('.date-picker').datetimepicker();
        }

    }
})();
