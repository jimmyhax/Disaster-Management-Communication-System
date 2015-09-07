(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Pet_VaccineCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Pet_VaccineCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Pet_VaccineCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

