#-----------------------------------------------------------------------------------------------#
# Test for validating the Reports page.
#
# Purpose: 
#   * to validate the UI of the Reports page
#   * check to see if the page contains the 'Inflow and Outflow' and 'Spend by Category' links.
#-----------------------------------------------------------------------------------------------#

# the Watir controller
require 'watir'
# Helper files
require '../helpers/urls'
require '../page-objects/reportspage'
require 'page-object'

# fetch the url from the helper urls.rb
test_url = path_to("home page")

#open a chrome browser
browser = Watir::Browser.new :chrome

#Declaring the instance for class Report
page = Reports.new(browser)

# Comments for test steps
puts "Beginning of test: Reports page UI Validation."

puts " Step 1: Navigate to the test site: " + test_url
browser.goto test_url

puts " Step 2: Click on the Reports link present in #{test_url} page"
page.reports_link_element.present?
page.reports_link_element.enabled?
page.reports_link_element.click

puts " Step 3: Verify if '#{page.inflow_outflow_link_element.text}' link is present"
page.inflow_outflow_link_element.present?
page.inflow_outflow_link_element.enabled?

puts " Step 4: Verify if '#{page.spending_a_category_link_element.text}' link is present"
page.spending_a_category_link_element.present?
page.spending_a_category_link_element.enabled?

puts " Expected Result:"
puts "  The Reports page should be displayed with '#{page.inflow_outflow_link_element.text}','#{page.spending_a_category_link_element.text}' links."

puts " Actual Result:"
if ( page.spending_a_category_link_element.present? && page.inflow_outflow_link_element.present? )
  puts "  Test Passed. Found the links: '#{page.inflow_outflow_link_element.text}','#{page.spending_a_category_link_element.text}'. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find links: '#{page.inflow_outflow_link_element.text}','#{page.spending_a_category_link_element.text}'." 
end

puts "End of test: Reports page UI Validation."

