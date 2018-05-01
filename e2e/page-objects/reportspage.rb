require 'rubygems'
require 'watir'
require 'page-object'
require 'test/unit/assertions'
include Test::Unit::Assertions

class Reports
    include PageObject
    link(:reports_link, text: 'Reports')
    link(:inflow_outflow_link, text: 'Inflow vs Outflow')
    link(:spending_a_category_link, text: 'Spending by Category')
end 

