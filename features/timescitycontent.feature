Feature: Checking Timescity Robots.txt for CDN domains

Scenario: All the URLs are not allowed by default

Given I read robots.txt at "js.timescitycontent.com" as "googlebot"
When I lookup for "http://js.timescitycontent.com"
Then It should not be allowed for crawling

Given I read robots.txt at "cs.timescitycontent.com" as "googlebot"
When I lookup for "http://js.timescitycontent.com"
Then It should not be allowed for crawling

Given I read robots.txt at "im.timescitycontent.com" as "googlebot"
When I lookup for "http://js.timescitycontent.com"
Then It should not be allowed for crawling

Scenario: Robots.txt has 0 sitemaps

Given I read robots.txt at "timescitycontent.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://js.timescitycontent.com"
Then The count of sitemaps is 0 

Given I read robots.txt at "timescitycontent.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://cs.timescitycontent.com"
Then The count of sitemaps is 0 

Given I read robots.txt at "timescitycontent.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://im.timescitycontent.com"
Then The count of sitemaps is 0 

