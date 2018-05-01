#-------------------------------------------------------------#
# Test for validating the Budgeting app page.
#
# Purpose: 
#   * to validate the UI of the home page
#   * check to see if the page contains the Budget and Report link.
#-------------------------------------------------------------#

# Watir controller
require 'watir'
# Helper file urls.rb
require '../helpers/urls'
# Page objects
require '../page-objects/budgetspage'

# Fetch the url from the helper urls.rb
test_url = path_to("home page")

# Open a chrome browser
browser = Watir::Browser.new :chrome

# Declaring the instance for class Budget
budget_page = Budget.new(browser)

# Comments for test steps
puts "Beginning of test: Budgeting page UI Validation."

puts " Step 1: Navigate to the test site: " + test_url
budget_page.goto test_url

puts " Step 2: Validating the UI elements present in #{test_url} page"

puts " Expected Result:"
puts "  The budgeting page should be shown with #{budget_page.budget_link_element.text} and #{budget_page.reports_link_element.text} tabs."

puts " Actual Result:"
if ( budget_page.budget_link? && budget_page.reports_link? )
  budget_page.budget_link_element.enabled?
  budget_page.budget_link_element.present?
  budget_page.reports_link_element.enabled?
  budget_page.reports_link_element.enabled?
  puts "  Test Passed. Found the links: #{budget_page.budget_link_element.text} && #{budget_page.reports_link_element.text}. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find links: #{budget_page.budget_link_element.text} && #{budget_page.reports_link_element.text}." 
end

puts "End of test: Budgeting page UI Validation."

