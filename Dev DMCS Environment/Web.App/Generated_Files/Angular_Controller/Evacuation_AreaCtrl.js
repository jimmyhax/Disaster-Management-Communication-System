(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Evacuation_AreaCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Evacuation_AreaCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Evacuation_AreaCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

