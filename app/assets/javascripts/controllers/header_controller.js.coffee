Blog = angular.module("Blog")

Blog.controller('HeaderController', ($scope, Notification) ->
  $scope.markedAsRead = false

  $scope.notifications = Notification.query(query: {read: false})

  $scope.markNotificationsAsRead = () ->
    if !$scope.markedAsRead
      $scope.markedAsRead = true
      Notification.markAllRead()
)