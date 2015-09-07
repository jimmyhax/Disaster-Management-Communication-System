(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Evacuation_Encounter_Shelter_EmployeeCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Evacuation_Encounter_Shelter_EmployeeCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Evacuation_Encounter_Shelter_EmployeeCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

