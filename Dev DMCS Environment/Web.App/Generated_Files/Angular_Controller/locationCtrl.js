(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:locationCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'locationCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', locationCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

