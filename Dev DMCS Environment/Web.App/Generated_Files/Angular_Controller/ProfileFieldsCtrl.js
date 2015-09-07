(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:ProfileFieldsCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'ProfileFieldsCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', ProfileFieldsCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

