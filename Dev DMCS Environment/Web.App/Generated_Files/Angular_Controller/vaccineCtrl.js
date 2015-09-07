(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:vaccineCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'vaccineCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', vaccineCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

