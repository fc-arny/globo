# -------------------------------------------------------------
# =Description:
# Rake task for creating postgres schemas
# -------------------------------------------------------------
namespace :db do
  desc "Run migration for creating schemas"
  task :create_schemas => :environment do
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate("db/migrate/schema", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end
end