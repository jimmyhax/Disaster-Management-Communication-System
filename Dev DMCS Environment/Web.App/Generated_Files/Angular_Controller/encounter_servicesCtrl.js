(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:encounter_servicesCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'encounter_servicesCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', encounter_servicesCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

