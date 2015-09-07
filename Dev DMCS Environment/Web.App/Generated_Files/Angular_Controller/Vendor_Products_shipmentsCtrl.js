(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Vendor_Products_shipmentsCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Vendor_Products_shipmentsCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Vendor_Products_shipmentsCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

