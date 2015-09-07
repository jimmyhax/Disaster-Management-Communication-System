(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:ShipmentCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'ShipmentCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', ShipmentCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

