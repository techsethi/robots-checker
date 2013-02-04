Feature: Checking Scorecard.Timescity Robots.txt

Scenario: All the URLs are not allowed by default

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I lookup for "http://scorecard.timescity.com"
Then It should not be allowed for crawling

Scenario: 2db is blocked for spiders

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I lookup for "http://scorecard.timescity.com/2db/abc"
Then It should not be allowed for crawling

Scenario: AjaxSearch is blocked for spiders

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I lookup for "http://scorecard.timescity.com/AjaxSearch/abc"
Then It should not be allowed for crawling

Scenario: gateway is blocked for spiders

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I lookup for "http://scorecard.timescity.com/gateway/abc"
Then It should not be allowed for crawling

Scenario: Crons is blocked for spiders at Design QC server

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I lookup for "http://scorecard.timescity.com/crons/abc"
Then It should not be allowed for crawling

Scenario: Robots.txt has 0 sitemaps

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://scorecard.timescity.com"
Then The count of sitemaps is 0 

Scenario: 404 page is blocked for spiders

Given I read robots.txt at "scorecard.timescity.com" as "googlebot"
When I lookup for "http://scorecard.timescity.com/404.php"
Then It should not be allowed for crawling

