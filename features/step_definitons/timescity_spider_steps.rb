Given /^I read robots\.txt at "(.*?)" as "(.*?)"$/ do |website, user_agent|
  @robots = Robots.new user_agent
  Robots.timeout = 10
end

When /^I lookup for "(.*?)"$/ do |url_to_crawl|
  @crawl_allowed = @robots.allowed?(url_to_crawl)
end

Then /^It should be allowed for crawling$/ do
  @crawl_allowed == true
end