require 'robots'
require 'awesome_print'

@robots_text = Robots.get_robots_txt('http://timescity.com', "google")
 @robots_text.each  { |arg|
 
 p arg
 
 }