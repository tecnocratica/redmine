desc "Run unicorn"
task :unicorn do
  system "bundle exec unicorn_rails -c config/unicorn.rb -Eproduction -D"
end