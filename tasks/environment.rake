desc "Load the environment"
task :environment do
  require File.expand_path('../../lib/endless', __FILE__)
end