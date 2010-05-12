# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_siteup-ng_session',
  :secret      => 'cad4fa86dff9eb8ea1982912f4b94c3eebed7dacd8a9a1622de33570647921ef54b60df2891083f4f216c75761fe977b2a5f8d8e65e007b6006dc0bf73b176b5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
