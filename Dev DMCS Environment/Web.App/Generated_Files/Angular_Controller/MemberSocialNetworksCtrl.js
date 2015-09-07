(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:MemberSocialNetworksCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'MemberSocialNetworksCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', 'dateTimeFactory', MemberSocialNetworksCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        //apply the date time picker to each date input box.
        dateTimeFactory.applyDatePicker();

   }
})();

