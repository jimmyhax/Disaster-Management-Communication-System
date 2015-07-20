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
        $scope.test = "HI!";
        $scope.columns = [{ id: '0', name: 'Address_ID' }, { id: '1', name: 'city' }];
        console.log($scope.columns);
        $scope.names = ['address_id', 'address_type_id', 'city', 'country', 'County_Township', 'longitude', 'latitude', 'state', 'str_add', 'str_add2', 'zip_plus_four'];
    }
})();
