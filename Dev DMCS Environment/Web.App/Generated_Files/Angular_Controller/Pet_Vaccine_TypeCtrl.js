(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Pet_Vaccine_TypeCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Pet_Vaccine_TypeCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Pet_Vaccine_TypeCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

