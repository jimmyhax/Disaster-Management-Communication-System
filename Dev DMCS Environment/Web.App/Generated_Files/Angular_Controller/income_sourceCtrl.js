(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:income_sourceCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'income_sourceCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', income_sourceCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

