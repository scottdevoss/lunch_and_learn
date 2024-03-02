class UserSerializer
  include JSONAPI::Serializer
  set_type :users
  attributes :name, :email, :api_key
end