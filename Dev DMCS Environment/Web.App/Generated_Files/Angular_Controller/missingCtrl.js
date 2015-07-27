(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:missingCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'missingCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', missingCtrl]);
        // 'Controller As' syntax
        var vm = this;
})();

