Feature: Checking Dev.Timescity Robots.txt

Scenario: All the URLs are not allowed by default

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I lookup for "http://dev.timescity.com"
Then It should not be allowed for crawling

Scenario: 2db is blocked for spiders

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I lookup for "http://dev.timescity.com/2db/abc"
Then It should not be allowed for crawling

Scenario: AjaxSearch is blocked for spiders

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I lookup for "http://dev.timescity.com/AjaxSearch/abc"
Then It should not be allowed for crawling

Scenario: fb is blocked for spiders

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I lookup for "http://dev.timescity.com/fb/abc"
Then It should not be allowed for crawling

Scenario: gateway is blocked for spiders

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I lookup for "http://dev.timescity.com/gateway/abc"
Then It should not be allowed for crawling

Scenario: Robots.txt has 0 sitemaps

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://dev.timescity.com"
Then The count of sitemaps is 0 

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

Given I am reading lastmod time of xml file of "4" entry of "1" sitemap
When I compare the difference between now & the timestamp
Then The difference should be less than "24" hours

Scenario: Chennai Sitemaps were updated in last 24 hours

Given I am reading lastmod time of xml file of "2" entry of "1" sitemap
When I compare the difference between now & the timestamp
Then The difference should be less than "24" hours

Scenario: BarsnClubs in Ahmedabad is blocked for spiders

Given I read robots.txt at "www.timescity.com" as "googlebot"
When I lookup for "http://timescity.com/ahmedabad/barsnclubs"
Then It should not be allowed for crawling

Scenario: Timespoynt is blocked for spiders

Given I read robots.txt at "www.timescity.com" as "googlebot"
When I lookup for "http://timescity.com/timespoynt"
Then It should not be allowed for crawling

Scenario: 404 page is blocked for spiders

Given I read robots.txt at "www.timescity.com" as "googlebot"
When I lookup for "http://timescity.com/404.php"
Then It should not be allowed for crawling

Scenario: Application Servlet at Live server is blocked for spiders

Given I read robots.txt at "www.timescity.com" as "googlebot"
When I lookup for "http://timescity.com/ApplicationServlet?KW=fame&ST=or&MCaI=4&CiI=2&MTC=Theatre&AP=SpSr&CoI=3&CiN=Mumbai&OBN=Y&BCaI=3&CaN=Movies&CaI=5&BCaN=Movie"
Then It should not be allowed for crawling

Scenario: Application Servlet at Dev server is blocked for spiders

Given I read robots.txt at "dev.timescity.com" as "googlebot"
When I lookup for "http://dev.timescity.com/ApplicationServlet?KW=fame&ST=or&MCaI=4&CiI=2&MTC=Theatre&AP=SpSr&CoI=3&CiN=Mumbai&OBN=Y&BCaI=3&CaN=Movies&CaI=5&BCaN=Movie"
Then It should not be allowed for crawling

Scenario: estsrp.php with tag is blocked for spiders

Given I read robots.txt at "www.timescity.com" as "googlebot"
When I lookup for "http://timescity.com/estsrp.php?bytags=info@jyotinivas.org"
Then It should not be allowed for crawling

Scenario: To verify new entry in sitemap at robots.txt

Given I read robots.txt at "www.timescity.com" as "googlebot"
When I count number of sitemaps listed in robots.txt of "http://timescity.com"
Then The count of sitemaps is greater than 11

