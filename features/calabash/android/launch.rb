require 'calabash-android/operations'

INSTALLATION_STATE = {
  :installed => false
}

Before do |scenario|
  scenario_tags = scenario.source_tag_names
  unless INSTALLATION_STATE[:installed]
    uninstall_apps
    install_app(ENV['TEST_APP_PATH'])
    install_app(ENV['APP_PATH'])
    INSTALLATION_STATE[:installed] = true
  end

  clear_app_data if scenario_tags.include?('@reinstall')

  start_test_server_in_background
end

After do
  shutdown_test_server
end
