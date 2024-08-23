class SeleniumUtils
  def find_element_byId(page, id_value)
    return page.driver.browser.find_element(:id, id_value)
  end

  def find_element_byXpath(page, xpath_value)
    # puts "xpath_value: #{xpath_value}"
    # if xpath_value.include? "Revisão"
    # end
    return page.driver.browser.find_element(:xpath => xpath_value)
  end

  def try_find_element_howManyTimesYouWant_byXpath(page, xpath_value, count)
    webElement = nil
    for i in 1..count
      webElement = find_element_byXpath(page, xpath_value)
      log("i: #{i} \t webElement: #{webElement}")
      if ((!webElement.nil?) && (webElement.text != ""))
        # puts "Foi preenchido os campos!"
        break
      else
        sleep 1
      end
    end
    return webElement
  end

  # Fim da classe
end
