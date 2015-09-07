(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:job_categoryCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'job_categoryCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', job_categoryCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

