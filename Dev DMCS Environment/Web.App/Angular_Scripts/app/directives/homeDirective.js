/// <reference path="../templates/homeTemplate.html" />
(function () {
    'use strict';

    /**
     * @ngdoc directive
     * @name limestoneApp.directive:yourDirName
     * @restrict AE
     * @scope  // add this attribute if you create a scope in your directive.
     *
     * @description
     * User-List Form. Users can interact with available and selected items list.
     *
     * @example
       <example module="limestoneApp">
         <file name="index.html">
           <your-directive
             type="vm.userType">
             <button>click</button>
           </your-directive>
         </file>
        </example>
     *
     * @requires common
     */
    angular
      .module('app')
      .directive('homeDirective', homeDirective);

    function homeDirective() {
        var directive = {
            restrict: 'AE',
            template: '<h1>FROM DIRECTIVE TEMPLATE</h1>',
            link: link,
            scope: {
                pass: '='
            }
        };
        return directive;

        function link(scope, element, attrs, ctrl) {
            /* implementation details */
            alert('directive is live! ' + scope.pass);
        }
    }
})();
