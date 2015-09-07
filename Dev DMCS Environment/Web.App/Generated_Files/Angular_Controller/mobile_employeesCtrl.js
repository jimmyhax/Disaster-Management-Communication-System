(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:mobile_employeesCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'mobile_employeesCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', mobile_employeesCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

