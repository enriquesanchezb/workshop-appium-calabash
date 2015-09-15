namespace :calabash do
  task :android do
    exec('calabash-android resign apps/Workshop.apk; bundle exec calabash-android run apps/Workshop.apk -p android-calabash')
  end

  task :ios do
    exec("DEVICE_TARGET='iPhone 6 (8.1 Simulator)' APP_BUNDLE_PATH='apps/Workshop-cal.app' bundle exec cucumber -p ios-calabash")
  end
end

namespace :appium do
  task :android do
    exec('bundle exec cucumber -p android-appium')
  end

  task :ios do
    exec('bundle exec cucumber -p ios-appium')
  end
end
