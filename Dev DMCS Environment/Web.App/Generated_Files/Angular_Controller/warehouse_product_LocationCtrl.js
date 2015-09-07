(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:warehouse_product_LocationCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'warehouse_product_LocationCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', warehouse_product_LocationCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

