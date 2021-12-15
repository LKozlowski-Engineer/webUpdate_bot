#  untitled.rb
#  
#  Copyright 2021  <pi@raspberrypi>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

require 'nokogiri' #parsing gem
require 'httparty' #HTTP request gem

require 'open-uri' #Wrapper for Net::HTTP, Net::HTTPS and Net::FTP

# Fetch and parse website
html = "https://www.youtube.com/results?search_query=ordinary+sausage"
doc = Nokogiri::HTML(URI.open(html))

# Gets a server response code. 200 == all is good
response = HTTParty.get(html)
puts response.code

# Finds the section of website we're interested in
description = doc.search('div')
#puts description
File.write("log.txt",description)
