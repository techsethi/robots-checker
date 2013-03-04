Given /^I read robots\.txt at "(.*?)" as "(.*?)"$/ do |website, user_agent|
  @robots = Robots.new user_agent
  raise "Unable to instantiate Robot" if @robots.nil?
  Robots.timeout = 30
  ap @robots
  
end

When /^I lookup for "(.*?)"$/ do |url_to_crawl|
    
  @crawl_allowed = @robots.allowed?(url_to_crawl)
  p @crawl_allowed
  
end

Then /^It should be allowed for crawling$/ do
  raise "Got #{@crawl_allowed} when expecting true." if (! @crawl_allowed)
end

Then /^It should not be allowed for crawling$/ do
  raise "Got #{@crawl_allowed} when expecting false." if (@crawl_allowed)
end


When /^I count number of sitemaps listed in robots\.txt of "(.*?)"$/ do |website|
  @other_data =   @robots.other_values(website) # gets misc. key/values (i.e. sitemaps)
  raise "Unable to get web site data" if @other_data.nil?
end

Then /^The count of sitemaps is atleast "(.*?)"$/ do |count_of_sitemap|
   if (  @other_data['Sitemap'].size < count_of_sitemap.to_i)
     raise "Count of sitemap is #{@other_data['Sitemap'].size} | Was expecting #{count_of_sitemap}"
   end
end

Given /^I am reading lastmod time of xml file of "(.*?)" entry of "(.*?)" sitemap$/ do |xml_file_count, sitemap_count|
  @robots = Robots.new "googlebot"
  Robots.timeout = 10
  @other_data =   @robots.other_values("http://timescity.com") # gets misc. key/values (i.e. sitemaps)
  url = @other_data['Sitemap'][xml_file_count.to_i - 1]
   xml_data = Net::HTTP.get_response(URI.parse(url)).body
  data = XmlSimple.xml_in(xml_data)
  @lastmod_time = data['sitemap'][sitemap_count.to_i - 1]['lastmod'][0]
end

When /^I compare the difference between now & the timestamp$/ do
  @last_mod_date = Time.parse(@lastmod_time)
  @time_diffs = Time.diff( @last_mod_date, Time.now, "%H")
end

Then /^The difference should be less than "(.*?)" hours$/ do |arg1|
  if @time_diffs[:hour] > 24
    raise "Sitemaps were generated #{@time_diffs[:hour]} hours ago."
  end
end

