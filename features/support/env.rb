# frozen_string_literal: true

require "rspec"
require "capybara/cucumber"
require "pry"
require "yaml"
require "ffaker"
require "selenium/webdriver"
require "report_builder"
require "httparty"
require "active_support"
require "active_support/core_ext"
require "crack" # for xml and json
require "i18n"

# LOGIN = YAML.load_file("features/support/pages/login.yml")
# PPAYMENTS = YAML.load_file("features/support/pages/payments/processpayments.yml")
# SPAYMENTS = YAML.load_file("features/support/pages/payments/schedulePayments.yml")
# CAPFUNDS = YAML.load_file("features/support/pages/payments/capture_funds.yml")
# REFUND = YAML.load_file("features/support/pages/payments/refund.yml")
# DASHBOARD = YAML.load_file("features/support/pages/reports/dashboard.yml")
# REPORTS = YAML.load_file("features/support/pages/reports/reports.yml")
# REPORTSDETAIL = YAML.load_file("features/support/pages/reports/reports_detail.yml")
# BATCHES = YAML.load_file("features/support/pages/reports/batches.yml")
# MAXIPAYMENTS = YAML.load_file("features/support/pages/maxiPay/payments.yml")
# MAXIREPORTS = YAML.load_file("features/support/pages/maxiPay/reports.yml")
# PORTAL = YAML.load_file("features/support/pages/maxiPay/portal.yml")
# ADMINSETTINGS = YAML.load_file("features/support/pages/admin/settings.yml")
# ADMINCUSTOMER = YAML.load_file("features/support/pages/admin/customer.yml")
# ADMINCARDS = YAML.load_file("features/support/pages/admin/cards.yml")
# DADOS = YAML.load_file("data/dados.yml")
# TEMPLATE = YAML.load_file("data/template_requests.yml")
# PROCESSORID = YAML.load_file("data/processor_boleto.yml")
# PBOLETO = YAML.load_file("features/support/pages/boleto/boleto.yml")
# PSCHEDULEREPORT = YAML.load_file("features/support/pages/reports/scheduled_report.yml")
# FRAUDCONTROL = YAML.load_file("features/support/pages/reports/fraud_control.yml")
# TXNPIX = YAML.load_file("features/support/pages/E2E/txn_pix.yml")

$maxiProxy = "10.225.79.160"
$maxiPort = "8080"

# if ENV["ambiente"] == "prd"
#   $vpos = "https:/uol.com.br"
#   $pedido_prod = 1
# elsif ENV["ambiente"] == "int"
#   $vpos = "https://testportal.maxipago.net/vpos/Login"
#   $portal_maxi = "https://testsecure.maxipago.net/maxipay"
#   $base_url_request = "https://testapi.maxipago.net"
#   $pedido_int = 1
# elsif ENV["ambiente"] == "homolog"
#   $vpos = "https://homolog.maxipago.net/vpos/Login"
#   $portal_maxi = "https://homolog.maxipago.net/maxipay"
#   $base_url_request = "https://homolog.maxipago.net"
#   $pedido_int = 1
# elsif ENV["ambiente"] == "int-green"
#   $vpos = "https://autodeploy-integration-green.maxipago.net/vpos/Login"
#   $portal_maxi = "https://autodeploy-integration-green.maxipago.net/maxipay"
#   $base_url_request = "https://autodeploy-integration-green.maxipago.net"
#   $pedido_int = 1
# elsif ENV["ambiente"] == "int-blue"
#   $vpos = "https://autodeploy-integration-blue.maxipago.net/vpos/Login"
#   $portal_maxi = "https://autodeploy-integration-blue.maxipago.net/maxipay"
#   $base_url_request = "https://autodeploy-integration-blue.maxipago.net"
#   $pedido_int = 1
# elsif ENV["ambiente"] == "preprod"
#   $vpos = "...."
#   $pedido_preprod = 1
# elsif ENV["ambiente"] == "qa"
#   # $vpos = "http://10.1.9.59:8080/vpos//Login"
#   $vpos = "http://qa-front.maxipago.net:8080/vpos//Login"
#   $portal_maxi = "http://qa-front.maxipago.net:8080/maxipay/"
#   $pedido_qa = 1
# elsif ENV["ambiente"] == "dev"
#   $vpos = "http://10.1.12.59:8080/vpos//Login"
#   $portal_maxi = "https://10.1.12.59:8080/maxipay/"
#   $pedido_dev = 1
# elsif ENV["ambiente"] == "docker"
#   $vpos = "http://localhost:8080/vpos//Login"
#   $portal_maxi = "http://localhost:8080/maxipay/"
#   $base_url_request = "https://localhost:8080"
#   $pedido_dev = 1
#   $merchantId = "6030"
#   $merchantKey = "qbbzgr744kf8nca1r188molh"
# else
#   $vpos = "...."
# end

# folder_Base = File.expand_path("./massa/tmp", File.dirname(__FILE__)).gsub("/", '\\')
# # criar uma pasta de backup e mover os arquivos para la
# $bkp_folder = File.join(folder_Base, "bkp").gsub("/", '\\')
# $folder_download = File.expand_path("./massa/tmp/download", File.dirname(__FILE__)).gsub("/", '\\')

# $screenshot = if ENV["screenshot"] == "true"
#                 true
#               else
#                 false
#               end
# #Colocar a observacao de Home Office para desativar o proxy
# if ENV["homeOffice"]
#   $sem_proxy_httparty = false
# end

# configuracao dos navegadores
if ENV["chrome"]
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--mute-audio")
    options.add_argument("--disable-infobars")
    options.add_preference("credentials_enable_service", false)
    options.add_preference("profile.password_manager_enabled", false)
    options.add_preference("download.default_directory", $folder_download)
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    caps["pageLoadStrategy"] = "none"
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, port: 9922, desired_capabilities: caps, switches: ["--disable-web-security", "--reduce-security-for-testing", "--repl", "--incognito"])
  end
elsif ENV["chrome_headless"]
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << "--headless"
      opts.args << "--disable-gpu" if Gem.win_platform?
      opts.args << "--no-sandbox"
      opts.args << "--disable-site-isolation-trials"
      opts.args << "--window-size=1920,1080"
    end

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options).tap do |d|
      d.browser.download_path = $folder_download
    end
  end

  Capybara.configure do |config|
    config.default_driver = :selenium_chrome_headless
  end
elsif ENV["chrome_gitlab"]
  $sem_proxy_httparty = true
  folder_Base = File.expand_path("./massa/tmp", File.dirname(__FILE__))
  $bkp_folder = File.join(folder_Base, "bkp")
  $folder_download = File.expand_path("./massa/tmp/download", File.dirname(__FILE__))

  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << "--headless"
      opts.args << "--disable-gpu" if Gem.win_platform?
      opts.args << "--no-sandbox"
      opts.args << "--disable-site-isolation-trials"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options).tap do |d|
      d.browser.download_path = $folder_download
    end
  end

  Capybara.configure do |config|
    config.default_driver = :selenium_chrome_headless
  end
elsif ENV["firefox"]
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app|
    options = Selenium::WebDriver::Firefox::Options.new
    options.add_argument("--mute-audio")
    options.add_argument("--disable-infobars")
    options.add_preference("credentials_enable_service", false)
    options.add_preference("profile.password_manager_enabled", false)
    options.add_preference("download.default_directory", $folder_download)
    caps = Selenium::WebDriver::Remote::Capabilities.firefox
    caps["pageLoadStrategy"] = "none"
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options, port: 9922, desired_capabilities: caps, switches: ["--disable-web-security", "--reduce-security-for-testing", "--repl", "--incognito"])
  end
elsif ENV["ie"]
  Capybara.default_driver = :ie
  Capybara.register_driver :ie do |app|
    Capybara::Selenium::Driver.new(app, browser: :internet_explorer)
  end
elsif ENV["headless_debug"]
  Capybara.default_driver = :poltergeist_debug
  Capybara.register_driver :poltergeist_debug do |app|
    Capybara::Poltergeist::Driver.new(app, inspector: true)
  end
  Capybara.javascript_driver = :poltergeist_debug
elsif ENV["headless"]
  Capybara.javascript_driver = :poltergeist
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :selenium
end
Capybara.default_max_wait_time = 10
