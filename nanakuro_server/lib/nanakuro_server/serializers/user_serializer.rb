require_relative 'base_serializer.rb'

class UserSerializer < BaseSerializer
  attribute :token

  def token
    payload = { id: object.id, email: object.email, token: object.token }
    JWT.encode payload, nil, 'none'
  end
end
