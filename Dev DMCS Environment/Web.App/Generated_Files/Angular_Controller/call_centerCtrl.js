(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:call_centerCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'call_centerCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', call_centerCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

