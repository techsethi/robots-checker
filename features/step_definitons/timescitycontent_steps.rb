Then /^The count of sitemaps is (\d+)$/ do |count_of_sitemap|
  if (@other_data['Sitemap'].nil?)
  # nothing
  else
    if (  @other_data['Sitemap'].size != count_of_sitemap)
      raise "Count of sitemap is #{@other_data['Sitemap'].size} | Was expecting #{count_of_sitemap}"
    end
  end  
end