(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:call_center_employeeCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'call_center_employeeCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', call_center_employeeCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

