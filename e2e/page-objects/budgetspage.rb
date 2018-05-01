require 'rubygems'
require 'watir'
require 'page-object'
require 'test/unit/assertions'
include Test::Unit::Assertions

class Budget
    include PageObject
    link(:budget_link, text: 'Budget')
    link(:reports_link, text: 'Reports')
    select_list(:category, name: 'categoryId')
    text_field(:description_textbox, name: 'description')
    text_field(:value, name: 'value')
    button(:add_button, text: 'Add')
end 



