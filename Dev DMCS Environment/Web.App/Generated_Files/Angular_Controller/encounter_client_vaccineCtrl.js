(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:encounter_client_vaccineCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'encounter_client_vaccineCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', encounter_client_vaccineCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

