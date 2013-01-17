require "active_support"
require "active_support/core_ext/module/delegation"
require "active_model"
require "orm_adapter"

module Perms
  class << self
    attr_accessor :allow_insecure_associations
  end
  self.allow_insecure_associations = false
  # {PermissionError} is raised when a security policy prevents
  # a called operation from being executed.
  class PermissionError < StandardError; end

  # {InsecureOperationError} is raised when a potentially unsafe
  # operation is about to be executed.
  class InsecureOperationError < StandardError; end

  # Using proxy for access control
  module Proxy; end
end

require "perms/proxy/record"
require "perms/evaluator"
require "perms/model"
require "perms/resource"
require "perms/resource_implementation"

__END__
TODO:
1. Проверка прав на валидаторы
2. Проверка прав на фикстуры
3. Хелперы для доступа к действиям