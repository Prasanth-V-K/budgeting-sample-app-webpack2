#-------------------------------------------------------------#
# Test for verifying the transaction in Budgeting app.
#
# Purpose: 
#   * to add a transaction
#   * check if the transaction is added
#   * verify the transaction category under Reports Tab.
#-------------------------------------------------------------#

# Watir controller
require 'watir'
# Helper file urls.rb
require '../helpers/urls'
# Constants
require '../helpers/constants'
# Page objects
require '../page-objects/budgetspage'
require '../page-objects/reportspage'

# Fetch the url from the helper urls.rb
test_url = path_to("home page")

# Open a chrome browser
browser = Watir::Browser.new :chrome

# Implicit wait
browser.driver.manage.timeouts.implicit_wait = 10

# Declaring the instance for classes
budget_page = Budget.new(browser)
reports_page = Reports.new(browser)

# Comments for test steps
puts "Beginning of test: Verifying the transaction test."

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

puts " Step 7: Verify that the transaction is added:"
budget_page.text.include?("#{TRANSACTION_DESCRIPTION}") 

puts " Step 8: Navigate to the Reports Page"
budget_page.reports_link_element.present?
budget_page.reports_link_element.enabled?
budget_page.reports_link_element.click

puts " Step 9: Verify if the '#{TRANSACTION_CATEGORY}' Category added is present"
reports_page.text.include?("#{TRANSACTION_CATEGORY}")

puts " Step 10: Click on the 'Spending by Category' link"
reports_page.spending_a_category_link_element.present?
reports_page.spending_a_category_link_element.enabled?
reports_page.spending_a_category_link_element.click

puts " Expected Result:"
puts "  The Transaction should be added with the Category '#{TRANSACTION_CATEGORY}' and description '#{TRANSACTION_DESCRIPTION}':"

puts " Actual Result:"
if ( reports_page.text.include?("#{TRANSACTION_CATEGORY}") ) 
  puts "  Test Passed. Found the transaction with Category: '#{TRANSACTION_CATEGORY}'. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find the transaction with Category: '#{TRANSACTION_CATEGORY}'." 
end

puts "End of test: Verifying the transaction test."
