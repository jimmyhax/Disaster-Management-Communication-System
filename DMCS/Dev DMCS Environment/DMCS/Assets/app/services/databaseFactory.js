(function () {
    'use strict';

    var serviceId = 'databaseFactory';
    angular.module('app').factory(serviceId,
      [databaseFactory]);

    function databaseFactory() {

        var service = {
            test: test
        };
        return service;

        /**
         * @name: functionName
         * @desc: some desc.
         * @param: some param
         * @returns: something?
         */
        function test() {
            alert("got factories down!");
        }

    }
})();
