app.controller('logincontroller', function ($scope, $http, $location) {
    $scope.checkifauth = function () {
        $scope.user = JSON.parse(localStorage.getItem('user'));
        if ($scope.user)
            window.location.href = 'index.html';

    }
    $scope.checkifauth();
    $scope.register = function (event) {
        event.preventDefault();
        $scope.account.role = 'User';
        console.log($scope.account);
        $http({
            method: 'post',
            url: api_url + 'users/create-user',
            data: JSON.stringify($scope.account)
        }).then((response) => {
            if (response.data)
                window.location.href = 'index.html';
        }).catch((error) => {
            console.log(error);
        })
    }
    $scope.login = function (event) {
        event.preventDefault();
        console.log($scope.account);
        $http({
            method: 'post',
            url: api_url + 'users/login',
            data: JSON.stringify($scope.account)
        }).then((response) => {
            console.log(response.data);
            $scope.user = response.data;
            console.log($scope.user);
            if (response.data) {
                localStorage.setItem('user', JSON.stringify($scope.user));
                if ($scope.user.role == "Admin")
                    window.location.href = 'userinfo-admin.html';
                else if ($scope.user.role == "Staff")
                    window.location.href = 'userinfo-staff.html';
                else if ($scope.user.role == "Manager")
                    window.location.href = 'userinfo-manager.html';
                else
                    window.location.href = "index.html";
            }

        }).catch((error) => {
            $('#error').show();
            $('#error').text(error.data.message);
            console.log(error);
        })
    }
   
})