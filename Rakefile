require_relative 'config/environment'
require 'sinatra/activerecord/rake'

namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task reseed: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ] do
    puts 'Reseeding completed.'
  end
end

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

