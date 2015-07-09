(function () {
    'use strict';

    var serviceId = 'someFactory';
    angular.module('app').factory(serviceId,
      [someFactory]);

    function someFactory() {

        var service = {
            someFunction: someFunction
        };
        return service;

        /**
         * @name enableDisableBtn
         * @desc Gets called when any checkbox is selected, enables or disables the button
         * @param itemList, model, showBtn, disableBtn
         * @returns none
         */
        function someFunction() {

        }

    }
})();
