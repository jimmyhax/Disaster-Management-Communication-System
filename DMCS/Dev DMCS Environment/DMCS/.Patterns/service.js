(function () {
    'use strict';

    var serviceId = 'serviceName';
    angular.module('app').factory(serviceId,
      [serviceName]);

    function serviceName() {

        var service = {
            functionOneName: functionOneName,
            functionTwoName: functionTwoName
        };
        return service;

        /**
         * @name: functionOneName
         * @desc: some desc.
         * @param: some param
         * @returns: something?
         */
        function functionOneName() {

        }

        /**
         * @name: functionTwoName
         * @desc: some desc.
         * @param: some param
         * @returns: something?
         */
        function functionTwoName() {

        }

    }
})();
