# Be sure to restart your server when you modify this file.
Gm::Application.config.session_store ActionDispatch::Session::MemCacheStore, expire_after: 2.months

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
