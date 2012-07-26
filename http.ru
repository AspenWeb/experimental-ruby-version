#!/usr/bin/env ruby
require 'thin'
require 'pry'
require 'erb'

app = proc do |env|
  
  pinfo = env['PATH_INFO'][1..-1]
  puts "pinfo: ", pinfo
  raw = ''
  open pinfo do |f|
    raw = f.read
  end

  pages = raw.split('')
  if pages.length == 1
    pages = ['', ''] + pages
  elsif pages.length == 2
    pages = [''] + pages
  end
  
  context = binding
  context.eval(pages[1])

  template = ERB.new pages[2]

  out = template.result(context)

  [
    200,          # Status code
    {             # Response headers
      'Content-Type' => 'text/html',
      'Content-Length' => out.length.to_s,
    },
    [out] # Response body
  ]
end

# You can install Rack middlewares
# to do some crazy stuff like logging,
# filtering, auth or build your own.
use Rack::CommonLogger

run app
