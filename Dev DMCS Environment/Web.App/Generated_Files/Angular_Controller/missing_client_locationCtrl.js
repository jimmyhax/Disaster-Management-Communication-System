(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:missing_client_locationCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'missing_client_locationCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', missing_client_locationCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

