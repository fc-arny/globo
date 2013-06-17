# Load routes
route_names = %W(
  api
  store
  admin
  user
  common)

route_names.each do |name|
  require Rails.root.join "config/routes/#{name}"
end


