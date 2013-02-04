Feature: Checking Timescity Robots.txt

Scenario: All the URLs are allowed by default

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com"
Then It should be allowed for crawling

Scenario: 2db is blocked for spiders

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com/2db/abc"
Then It should not be allowed for crawling

Scenario: AjaxSearch is blocked for spiders

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com/AjaxSearch/abc"
Then It should not be allowed for crawling

Scenario: fb is blocked for spiders

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com/fb/abc"
Then It should not be allowed for crawling

Scenario: gateway is blocked for spiders

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com/gateway/abc"
Then It should not be allowed for crawling

Scenario: Robots.txt has atleast 11 sitemaps

Given I read robots.txt at "timescity.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://timescity.com"
Then The count of sitemaps is atleast "11"

Scenario: Bengaluru Sitemaps were updated in last 24 hours

Given I am reading lastmod time of xml file of "1" entry of "1" sitemap
When I compare the difference between now & the timestamp
Then The difference should be less than "24" hours

Scenario: Delhi Sitemaps were updated in last 24 hours

Given I am reading lastmod time of xml file of "3" entry of "1" sitemap
When I compare the difference between now & the timestamp
Then The difference should be less than "24" hours

Scenario: Mumbai Sitemaps were updated in last 24 hours

Given I am reading lastmod time of xml file of "7" entry of "1" sitemap
When I compare the difference between now & the timestamp
Then The difference should be less than "24" hours

Scenario: Goa Sitemaps were updated in last 24 hours

Given I am reading lastmod time of xml file of "4" entry of "2" sitemap
When I compare the difference between now & the timestamp
Then The difference should be less than "24" hours

Scenario: Timescity Blog is open for crawling

Given I read robots.txt at "timescity.com" as "googlebot"
When I lookup for "http://timescity.com/blog"
Then It should be allowed for crawling


