require 'rubygems'
require 'bundler/setup'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["RAILS_ENV"] = "test"

require 'minitest/autorun'
require 'rails'
require 'action_controller'
require 'action_view'
require 'rails/test_help'
require 'bootstrap-form'

module BootstrapForm
  class Application < Rails::Application ; end
end

BootstrapForm::Application.routes.draw do
  match '/:controller(/:action(/:id))'
end

ActionController::Base.send :include, BootstrapForm::Application.routes.url_helpers
