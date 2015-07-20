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
    var controllerId = 'gridCtrl';
    angular.module('app', ['ngTable']).controller(controllerId,
      ['$scope', '$http', 'ngTableParams', gridCtrl]);

    function gridCtrl($scope, $http, ngTableParams) {
        var data = [
        { name: "Moroni", age: 50 },
        { name: "Tiancum", age: 43 },
        { name: "Jacob", age: 27 },
        { name: "Nephi", age: 29 },
        { name: "Enos", age: 34 },
        { name: "Tiancum", age: 43 },
        { name: "Jacob", age: 27 },
        { name: "Nephi", age: 29 },
        { name: "Enos", age: 34 },
        { name: "Tiancum", age: 43 },
        { name: "Jacob", age: 27 },
        { name: "Nephi", age: 29 },
        { name: "Enos", age: 34 },
        { name: "Tiancum", age: 43 },
        { name: "Jacob", age: 27 },
        { name: "Nephi", age: 29 },
        { name: "Enos", age: 34 }
        ];

        $scope.tableParams = new ngTableParams({
            page: 1,            // show first page
            count: 10           // count per page
        }, {
            total: data.length, // length of data
            getData: function ($defer, params) {
                $defer.resolve(data.slice((params.page() - 1) * params.count(), params.page() * params.count()));
            }
        })
    }
})();
