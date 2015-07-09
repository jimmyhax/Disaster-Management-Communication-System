(function () {
    'use strict';

    var serviceId = 'homeFactory';
    angular.module('app').factory(serviceId,
      [homeFactory]);

    function homeFactory() {

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
            alert('Factory is built!');
        }

    }
})();
