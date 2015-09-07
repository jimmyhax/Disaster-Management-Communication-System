(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:disaster_encounterCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'disaster_encounterCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', disaster_encounterCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

