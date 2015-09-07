(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:Client_ShelterCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'Client_ShelterCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', Client_ShelterCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

