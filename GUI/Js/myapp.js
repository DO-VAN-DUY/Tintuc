var api_url = "http://localhost:11111/";
const app = angular.module('myapp',['angular-loading-bar','ngResource']).config(['cfpLoadingBarProvider', function(cfpLoadingBarProvider,$interpolateProvider) {
    cfpLoadingBarProvider.includeSpinner = false;
  }])
;
// app.config(function($httpProvider){
//     $httpProvider.defaults.commom['Authorization'] = 'Bearer' + token;
// });

app.filter('unsafe', function ($sce) {
    return function (text) {
        return text ? $sce.trustAsHtml(text.replace(/\n/g, '<br/>')) : '';
    };
});
// app.filter('newlines', function () {
//     return function(text) {
//         return 
//    };
// });
//app.filter('dateformat', function())
app.factory('dataService', ['$http', function ($http) {
  var serviceBase = '/user/admin/api/';
  var dataFactory = {};

  dataFactory.checkUniqueValue = function (property, value) {
      // if(!id) id = 0;
      return $http.get(serviceBase + 'checkunique?property=' + property + '&value=' + escape(value)).then((response) => {
          return response.data;
      });
  }
  return dataFactory;
}])
app.directive('checkUnique', ['dataService', function (dataService) {
  return {
      restrict: 'A',
      require: 'ngModel',
      link: function (scope, element, attrs, ngModel) {
          element.bind('blur', function (e) {
              if (!ngModel || !element.val()) {
                  return;
              }
              var keyProperty = scope.$eval(attrs.checkUnique);
              var currentValue = element.val();
              dataService.checkUniqueValue(keyProperty.property, currentValue).then((response) => {
                  if (response === 'not_unique')
                      ngModel.$setValidity(keyProperty.property, false);
                  else {
                      ngModel.$setValidity(keyProperty.property, true);
                  }


              });
          })
      }
  }
}])

app.directive("ngFileSelect", function () {
  return {
      require: 'ngModel',
      link: function ($scope, el, attrs, ngModel) {
          el.bind("change", function (e) {
              $scope.file = (e.srcElement || e.target).files[0];
              ngModel.$setViewValue($scope.file);
              $scope.getFile();
          })
      }
  }
})
app.directive('postsPagination', function () {
    return {
        restrict: 'E',
        template: '<ul ng-show="totalPages>1" class="pagination">' +
            '<li class="page-item" ng-show="currentPage != 1"><a ng-click="getUrl(1)" class="page-link" href="">«</a></li>' +
            '<li class="page-item" ng-show="currentPage != 1"><a ng-click="getUrl(currentPage-1)" class="page-link" href="">‹ Prev</a></li>' +
            '<li class="page-item" ng-repeat="i in range" ng-class="{active : currentPage == i}">' +
            '<a ng-click="getUrl(i)" class="page-link" href="">{{i}}</a>' +
            '</li>' +
            '<li class="page-item" ng-show="currentPage != totalPages"><a ng-click="getUrl(currentPage+1)" class="page-link" href="">Next ›</a></li>' +
            '<li class="page-item" ng-show="currentPage != totalPages"><a ng-click="getUrl(totalPages)" class="page-link" href="">»</a></li>' +
            '</ul>',     
    };
});
app.directive('homePagination', function () {
    return {
        restrict: 'E',
        template: 
            '<a ng-show="currentPage != 1" class="btn_pagging" href="?page=1">«</a>' +
            '<a ng-show="currentPage != 1" class="btn_pagging" href="?page={{currentPage-1}}">Prev</a>' +
            '<a ng-repeat="i in range" ng-class="{active : currentPage == i}" class="btn_pagging" href="?page={{i}}">{{i}}</a>' +
            '<a ng-show="currentPage != totalPages" class="btn_pagging" href="?page={{currentPage+1}}">Next</a>' +
            '<a ng-show="currentPage != totalPages" class="btn_pagging" href="?page={{totalPages}}">»</a>',     
    };
});
app.filter('gender', function () {
  return function (value) {
      if (value == 1)
          return 'Nam';
      return 'Nữ';
  }
});
app.filter('job', function () {
  return function (value) {
      if (value == 'staff')
          return 'Nhân viên';
      return 'Quản lý';
  }
});

app.directive('ckEditor', function ($timeout) {
  return {
      require: '?ngModel',
      link: function (scope, elm, attrs, ngModel) {  
          ngModel.$setValidity(scope.$eval(attrs.ckEditor).property,false);        
          if (!ngModel) return;
          var ck = CKEDITOR.instances[elm[0].id];
          ck.on('change', function () {                               
            //   scope.$apply(function () {
                
            //   });         
              ngModel.$setViewValue(ck.getData());            
              $timeout(function(){
                  if(ck.getData()=='')
                  ngModel.$setValidity(scope.$eval(attrs.ckEditor).property,false);
              else ngModel.$setValidity(scope.$eval(attrs.ckEditor).property,true);
                
            })
            
          });
          ngModel.$render = function(value) {
            ck.setData(ngModel.$viewValue);
          }; 
         
      }
  };
});

app.directive('validFile', function () {
  return {
      require: 'ngModel',
      link: function (scope, el, attrs, ngModel) {
          el.bind('change', function () {
              scope.$apply(function () {
                  ngModel.$setValidity('image',true);
                  ngModel.$setViewValue(el.val());
              });
          });
      }
  }
});

