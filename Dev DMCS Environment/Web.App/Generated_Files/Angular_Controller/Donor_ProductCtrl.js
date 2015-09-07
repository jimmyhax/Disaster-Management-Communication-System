(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Donor_ProductCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Donor_ProductCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Donor_ProductCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

