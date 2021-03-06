(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:resourceCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'resourceCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', resourceCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

