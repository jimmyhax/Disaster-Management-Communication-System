(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:mobile_unitCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'mobile_unitCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', mobile_unitCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

