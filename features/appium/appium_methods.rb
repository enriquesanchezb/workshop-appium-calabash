module AppiumMethods
  def press(element)
    wait = Selenium::WebDriver::Wait.new :timeout => 10
    wait.until { find_element(:id, @list_of_elements[element][@platform][@env]).displayed? }
    find_element(:id, @list_of_elements[element][@platform][@env]).click
  end

  def fill(element, text)
    press(element)
    find_element(:id, @list_of_elements[element][@platform][@env]).send_keys(text)
  end

  def exists?(element)
    exists { find(element) }
  end
end
