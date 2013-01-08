Given /^I read robots\.txt at "(.*?)" as "(.*?)"$/ do |web_site, user_agent|
  @robots_text = Robots.get_robots_txt('http://timescity.com/robots.txt', user_agent)
  debugger
  ap @robots_text
end

When /^I my user\-agent is "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^Allow should contain "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end