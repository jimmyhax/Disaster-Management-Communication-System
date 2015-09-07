(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:MemberAttemptsCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'MemberAttemptsCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', MemberAttemptsCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

