@GoodsController = ($scope,$http) ->

  $http.get('/api/v1/goods/search.json?store_id=2').success (data) ->
    $scope.goods = data

###

@LoginCtrl = ($scope) ->
  $scope.email = {
    text: '',
    error: 'Все чисто'
  }
  $scope.password = {
    text: '',
  }
  $scope.error = {
    state: false
    text: ''
  }

  _validateField = (field, test) ->

    if field.text isnt test
      field.error = true
      field.errorText = 'Ошибка! Текст должен быть такой: ' + test
    else
      field.error = false
      field.errorText = ''


  $scope.submitForm = () ->
    _validateField $scope.email, '222'
    _validateField $scope.password, '111'

    if $scope.email.error or $scope.password.error
      $scope.error.state = true
      $scope.error.text = 'Логин или пароль заданы неправильно! Введите 222/111'
    else
      $scope.error.state = false
      $scope.error.text = 'Ошибки нет!'

###


