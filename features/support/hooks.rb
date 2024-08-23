# frozen_string_literal: true

require "selenium-webdriver"
require "report_builder"
# require "log4r"
# require "log4r/yamlconfigurator"
# Log4r::YamlConfigurator.load_yaml_file(File.expand_path("../../../log4r.yml", __FILE__))

Before do |scn|
  begin
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    page.driver.browser.manage.window.maximize
    log("$screenshot: #{$screenshot}")

    if $screenshot
      file_name = scn.name.gsub(" ", "_").gsub("/", "_").downcase
      file_name = file_name.gsub(",", "").gsub("#", "").gsub("(", "").gsub(")", "")
      date = Time.now.strftime("%d%m%Y_%H")
      $file_evidencia_base = "results/evidencias/#{date}/#{file_name}/"
      FileUtils.mkdir_p($file_evidencia_base) unless Dir.exist?($file_evidencia_base)
    end
  rescue StandardError => e
    log("Browser initialization failed: #{e.message}")
    raise
  end

  $count = 0
end


# ReportBuilder.configure do |config|
#   config.json_path = "results/report_ok.json"
#   config.report_path = "results/report_ok_rp"
#   config.report_types = [:html]
#   config.report_title = "Report_vPos"
#   config.color = "orange"
#   config.include_images = true

#   $ambiente = if $pedido_int == 1
#                 "Integracao"
#               elsif $pedido_prod == 1
#                 "Producao"
#               else
#                 "Pre_Producao"
#               end

#   config.additional_info = { browser: "Chrome", environment: $ambiente }
# end

After do |scenario|
  # file_name = scenario.name.gsub(" ", "_").downcase!
  # target = "results/error/#{file_name}.png"
  # if scenario.failed?
  #   page.save_screenshot(target)
  #   embed(target, "image/png", "Evidencia")
    
  #   log($response if defined?($response))
  # end

  begin
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    Capybara.current_session.driver.quit
  rescue StandardError => e
    log("Não foi inicializado o browser!")
  end
end

# at_exit do
#   ReportBuilder.build_report
# end
