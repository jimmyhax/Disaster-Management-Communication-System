(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:employee_clientsCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'employee_clientsCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', employee_clientsCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

