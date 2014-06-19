namespace :globo do
  desc 'Prepare data for globo'
  task :bootstrap => :environment do
    %W(db:drop db:create db:migrate db:seed:admin db:seed:categories).each do |t|
      Rake::Task[t].invoke
    end
  end
end