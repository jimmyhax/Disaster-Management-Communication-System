(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:PetCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'PetCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', PetCtrl]);
    function PetCtrl() {
        // 'Controller As' syntax
        var vm = this;
        init_jQuery();

        function init_jQuery() {
            $('.date-picker').datetimepicker();
        }
    }
})();

