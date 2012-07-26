#!/usr/bin/env ruby
require 'thin'
require 'pry'

app = proc do |env|
  binding.pry
  
  # translate URL path to the filesystem
  # open file and parse as simplate
  # eval
 
  pinfo = env['PATH_INFO'][1..-1]
  puts "pinfo: ", pinfo
  raw = ''
  open pinfo do |f|
    raw = f.read
  end

  [
    200,          # Status code
    {             # Response headers
      'Content-Type' => 'text/html',
      'Content-Length' => raw.length.to_s,
    },
    [raw] # Response body
  ]
end

# You can install Rack middlewares
# to do some crazy stuff like logging,
# filtering, auth or build your own.
use Rack::CommonLogger

run app
