(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Pet_MissingCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Pet_MissingCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Pet_MissingCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

