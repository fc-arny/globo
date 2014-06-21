namespace :globo do
  desc 'Prepare data for globo'
  task :bootstrap => :environment do
    %W(db:drop db:create db:migrate db:seed:admin db:seed:categories db:seed:measures).each do |t|
      Rake::Task[t].invoke
    end
  end
end