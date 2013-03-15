# -------------------------------------------------------------
#
# -------------------------------------------------------------
class UsersWorker
  include Sidekiq::Worker

  def perform
    puts 'ssss'
  end
end