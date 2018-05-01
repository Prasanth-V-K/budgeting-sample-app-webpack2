#---------------------------------------------------------------------------#
# Test for adding an invalid transaction in Budgeting app.
#
# Purpose: 
#   * to add an invalid transaction
#   * check if the appropriate comments are triggered for the failing test.
#---------------------------------------------------------------------------#

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
puts "Beginning of test: Adding an Invalid transaction test."

puts " Step 1: Navigate to the test site: " + test_url
budget_page.goto test_url

puts " Step 2: Select the value '#{TRANSACTION_CATEGORY}' from the Category drop-down: "
budget_page.category_element.select("#{TRANSACTION_CATEGORY}")

puts " Step 3: Enter the description as '#{INVALID_TRANSACTION_DESCRIPTION}': "
budget_page.description_textbox_element.set("#{INVALID_TRANSACTION_DESCRIPTION}")

puts " Step 4: Enter the Value as '#{INVALID_TRANSACTION_VALUE}':"
budget_page.value_element.set("#{INVALID_TRANSACTION_VALUE}")

puts " Expected Result:"
puts "  The Add button should be enabled for a Valid Transaction."

puts " Actual Result:"
if ( budget_page.add_button_element.enabled? && budget_page.add_button_element.present? )
  puts "  Test Passed. Found the 'Add' button. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find the 'Add' button as it is an 'Invalid Transaction'." 
end

puts "End of test: Adding a Invalid transaction test."

