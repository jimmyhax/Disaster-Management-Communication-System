(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:addressCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'addressCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', addressCtrl]);
        // 'Controller As' syntax
        var vm = this;
})();
