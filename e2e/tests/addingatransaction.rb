#-------------------------------------------------------------#
# Test for adding a transaction in Budgeting app.
#
# Purpose: 
#   * to add a transaction
#   * check if the transaction is added
#-------------------------------------------------------------#

# Watir controller
require 'watir'
require 'test/unit'
# Helper file urls.rb
require '../helpers/urls'
# Constants
require '../helpers/constants'
# Page objects
require '../page-objects/budgetspage'

# Fetch the url from the helper urls.rb
test_url = path_to("home page")

# Open a chrome browser
browser = Watir::Browser.new :chrome

# Declaring the instance for class Budget
budget_page = Budget.new(browser)

# Comments for test steps
puts "Beginning of test: Adding a transaction test."

puts " Step 1: Navigate to the test site: " + test_url
budget_page.goto test_url

puts " Step 2: Select the value '#{TRANSACTION_CATEGORY}' from the Category drop-down: "
budget_page.category_element.select("#{TRANSACTION_CATEGORY}")

puts " Step 3: Enter the description as '#{TRANSACTION_DESCRIPTION}': "
budget_page.description_textbox_element.set("#{TRANSACTION_DESCRIPTION}")

puts " Step 4: Enter the Value as '#{TRANSACTION_VALUE}':"
budget_page.value_element.set("#{TRANSACTION_VALUE}")

puts " Step 5: Verify that the 'Add' button is enabled:"
budget_page.add_button_element.enabled?

puts " Step 6: Click on the 'Add' button:"
budget_page.add_button_element.click

# Implicit wait
budget_page.driver.manage.timeouts.implicit_wait = 25

puts " Expected Result:"
puts "  The Transaction should be added with the corresponding description."

puts " Actual Result:"
if budget_page.text.include?("#{TRANSACTION_DESCRIPTION}") 
  puts "  Test Passed. Found the transaction: '#{TRANSACTION_DESCRIPTION}'. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find the transaction: '#{TRANSACTION_DESCRIPTION}'." 
end

puts "End of test: Adding a transaction test."

