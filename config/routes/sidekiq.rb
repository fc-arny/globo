require 'sidekiq/web'

Sap::Application.routes.draw do
  # For Developers
  mount Sidekiq::Web, at: '/admin/sidekiq'
  # /newrelic - open profiler
end