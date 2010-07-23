# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cloud-it_session',
  :secret      => '773f4c551e466f551dacd8c104d3f2c1de52afb4e93709f23cda26cd8b6dd4a6f5513a6a4bfabe6dcd4f9f1de10b6ea11bb97282f33bf813f4eeb31742004869'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
