require "safariwatir"

# SITE = "http://bizzapi7.herokuapp.com"
SITE = "http://localhost:5000"
BROWSER = Watir::Safari.new
PAGES = {
  "bizzapi Home" => SITE
}

Given /^that I am on (.*)$/ do |page|
  BROWSER.goto(PAGES[page])
end

Then /^the page should include (.*)$/ do |text|
  BROWSER.text.should include text
end
