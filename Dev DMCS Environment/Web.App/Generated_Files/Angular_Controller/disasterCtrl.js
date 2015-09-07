(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:disasterCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'disasterCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', disasterCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

