registerController("ExampleController", ['$api', '$scope', function($api, $scope) {
    $api.request({
        module: 'ExampleModule',
        action: 'getHello'
    }, function(response) {
        $scope.hello = response.text;
    });
}]);
