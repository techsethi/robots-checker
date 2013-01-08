Feature: Checking Timescity Robots.txt

Scenario: All the URLs are allowed by default

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com"
Then It should be allowed for crawling
