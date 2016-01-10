class User < BaseModel
  include Ohm::Timestamps

  attribute :name

  # User email, provided by the OAuth provider. It can be nil.
  attribute :email
  unique :email

  # Unique identifier for this user, in the form "{provider}|{provider-id}"
  attribute :uid
  index     :uid
  unique    :uid

  # Session token
  attribute :token
  index     :token

  # Submitted movies
  collection :movies, :Movie
end
