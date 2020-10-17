# frozen_string_literal: true

namespace :db do
  namespace :integration do
    desc 'Prepares the database for integration testing (rebuild and seed)'
    task bootstrap: :environment do
      if ENV['RAILS_ENV'] == 'test'
        Rake::Task['db:test:rebuild'].invoke
        Rake::Task['db:seed:integration'].invoke
      else
        system('rake db:integration:bootstrap RAILS_ENV=test')
      end
    end
  end
  namespace :test do
    desc 'Recreates the test database'
    task rebuild: :environment do
      if ENV['RAILS_ENV'] == 'test'
        Rake::Task['db:drop'].invoke
        Rake::Task['db:create'].invoke
        Rake::Task['db:schema:load'].invoke
      else
        system('rake db:test:rebuild RAILS_ENV=test')
      end
    end
  end
end
