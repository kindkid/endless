require "endless/version"

tried_with_rubygems = false
begin
  require 'sinatra/async'
  require 'thin'
rescue => e
  raise if tried_with_rubygems
  tried_with_rubygems = true
  require 'rubygems'
  retry
end

require 'endless/app'
