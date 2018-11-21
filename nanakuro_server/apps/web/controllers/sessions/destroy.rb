module Web
  module Controllers
    module Sessions
      class Destroy
        include Web::Action

        params do
          required(:token).filled(:str?)
        end

        def call(params)
          id, token = parse_jwt(params).values_at('id', 'token')
          repo = UserRepository.new
          if repo.find(id).token == token
            self.status = 204
            repo.update(id, token: nil)
          else
            halt 422
          end
        rescue JWT::DecodeError => _
          halt 422
        end

        private
          def parse_jwt(params)
            decoded_token = JWT.decode params.get(:token), nil, false
            decoded_token[0]
          end
      end
    end
  end
end
