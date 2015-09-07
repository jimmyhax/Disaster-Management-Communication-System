(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:house_choiceCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'house_choiceCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', house_choiceCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

