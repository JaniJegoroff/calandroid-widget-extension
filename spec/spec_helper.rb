require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require 'minitest/reporters'

require 'calandroid-widget-extension'

require_relative 'stubs/calabash_android_operations_stub'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
