(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Order_ProductCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Order_ProductCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Order_ProductCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

