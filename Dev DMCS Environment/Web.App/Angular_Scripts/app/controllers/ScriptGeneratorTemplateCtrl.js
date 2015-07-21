(function () {
    'use strict';

    /**
     * @ngdoc controller
     * @name app.controller:ScriptGeneratorTemplateCtrl
     *
     * @description
     * Define controller name, inject dependencies, point to def function.
     *
     * @requires common
     * @requires datacontext
     */
    var controllerId = 'ScriptGeneratorTemplateCtrl';
    angular.module('app').controller(controllerId,
      ['$scope', ScriptGeneratorTemplateCtrl]);

    function ScriptGeneratorTemplateCtrl($scope) {
        // 'Controller As' syntax
        var vm = this;

    }
})();
