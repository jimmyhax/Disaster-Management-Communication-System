(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:medical_assistanceCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'medical_assistanceCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', medical_assistanceCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

