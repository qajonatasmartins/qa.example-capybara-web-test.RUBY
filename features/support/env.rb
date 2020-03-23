require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

## importar o arquivo helpers.rb
require_relative "helpers"
# para falar que todos os recursos do helpers é nativo dentro da execução do cucumber
# dessa forma eu posso invocar o helpers de qualquer lugar.
World(Helpers)
#config carrega o arquivo de ambiente

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

case ENV["BROWSER"]
when "chrome"
  @driver = :selenium_chrome
when "firefox"
  @driver = :selenium
when "firefox_headless"
  @driver = :selenium_headless
when "chrome_headless"
  @driver = :selenium_chrome_headless
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"]
  #"http://192.168.99.100:8080" #docker toolbox
  config.default_max_wait_time = 30
end
