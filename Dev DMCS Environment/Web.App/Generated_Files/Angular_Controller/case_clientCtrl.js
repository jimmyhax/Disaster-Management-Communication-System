(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:case_clientCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'case_clientCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', case_clientCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

