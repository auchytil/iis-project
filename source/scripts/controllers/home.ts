/// <reference path="../libs/angular.d.ts"/>
class HomeController {
    constructor(private $scope: ng.IScope) {
    }
}
var app = angular.module("app", []);
app.controller("HomeController", ["$scope", HomeController]); 
