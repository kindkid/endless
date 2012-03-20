desc "Run the server"
task :server, [:port] => :environment do |t, args|
  Endless::App.run! :port => (args[:port] || 5678)
end