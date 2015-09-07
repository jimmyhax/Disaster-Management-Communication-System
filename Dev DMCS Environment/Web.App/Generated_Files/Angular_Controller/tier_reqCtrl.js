(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:tier_reqCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'tier_reqCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', tier_reqCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

