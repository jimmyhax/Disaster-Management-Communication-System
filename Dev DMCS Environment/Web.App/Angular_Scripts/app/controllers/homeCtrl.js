(function () {
    'use strict';

    /**
     * @ngdoc controller
     * @name app.controller:homeCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'homeCtrl';
    angular.module('app').controller(controllerId,
      ['homeFactory', homeCtrl]);

    function homeCtrl(homeFactory) {
        vm.pass = "Passed string from server rendered HTML";
        // 'Controller As' syntax
        var vm = this;
        someFunction();
        /**
         * @ngdoc method
         * @name limestoneApp.controller:homeCtrl#someFunction
         * @methodOf limestoneApp.controller:homeCtrl
         *
         * @description
         * Get Data via datacontext factory.
         *
         * @param {object} oldVar Old value
         *
         * @returns {var} vm.someVarInView
         */
        function someFunction() {
            alert('controller is linked!');
            homeFactory.someFunction();
        }
    }
})();
