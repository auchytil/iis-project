/// <reference path="libs/angular.d.ts" />

var app = angular.module('app', ["ui.router"]);
app.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise("/");

    /*$stateProvider.state("home", {
        url: "/",
        templateUrl: "../templates/home.html",
        controller: HomeController,
        controllerAs: "home"
    });*/
}]);
