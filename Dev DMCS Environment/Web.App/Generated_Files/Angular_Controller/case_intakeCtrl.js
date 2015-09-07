(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:case_intakeCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'case_intakeCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', case_intakeCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

