(function () {
    'use strict';
    /**
     * @ngdoc controller
     * @name app.controller:personCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'personCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', personCtrl]);
        // 'Controller As' syntax
        var vm = this;
})();

