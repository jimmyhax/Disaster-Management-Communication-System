(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Pet_DeceasedCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Pet_DeceasedCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Pet_DeceasedCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

