(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Mobile_ProductCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Mobile_ProductCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Mobile_ProductCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

