require 'require_all'

require 'rspec'
require 'rspec/expectations'
require 'byebug'

if ENV['PLATFORM'].eql? 'appium'
  require 'appium_lib'
  require File.join(File.dirname(__FILE__), '../appium/appium_methods')

  # Create a custom World module so we don't pollute `Object` with Appium
  module AppiumWorld
  end

  # Load the desired configuration from appium.txt, create a driver then
  # Add the methods to the world
  if ENV['ENV'].eql? 'ios'
    caps = Appium.load_appium_txt file: File.join(File.dirname(__FILE__), '../appium/ios/appium.txt')
  elsif ENV['ENV'].eql? 'android'
    caps = Appium.load_appium_txt file: File.join(File.dirname(__FILE__), '../appium/android/appium.txt')
  else
    fail('Environment not valid')
  end
  Appium::Driver.new(caps)
  Appium.promote_appium_methods AppiumWorld

  World do
    AppiumWorld
  end

  Before { $driver.start_driver }
  After { $driver.driver_quit }

elsif ENV['PLATFORM'].eql? 'calabash'
  require File.join(File.dirname(__FILE__), '../calabash/calabash_methods')
  if ENV['ENV'].eql? 'ios'
    require 'calabash-cucumber/cucumber'
    require File.join(File.dirname(__FILE__), '../calabash/ios/launch')
  elsif ENV['ENV'].eql? 'android'
    require 'calabash-android/cucumber'
    require File.join(File.dirname(__FILE__), '../calabash/android/launch')
  else
    fail('ENV not valid')
  end
else
  fail('PLATFORM not valid')
end

$LOAD_PATH << './workshop_test'

require_all 'workshop_test'
require_all 'workshop_test/screens'
