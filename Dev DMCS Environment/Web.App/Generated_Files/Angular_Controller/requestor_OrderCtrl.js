(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:requestor_OrderCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'requestor_OrderCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', requestor_OrderCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

