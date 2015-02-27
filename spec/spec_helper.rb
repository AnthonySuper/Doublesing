$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'doublesing'
