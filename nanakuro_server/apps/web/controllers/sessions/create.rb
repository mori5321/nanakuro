module Web
  module Controllers
    module Sessions
      class Create
        include Web::Action
        expose :user

        params do
          required(:user).schema do
            required(:email).filled(:str?)
            required(:password).filled(:str?)
          end
        end

        def call(params)
          halt 422 unless params.valid?
          login
        end

        def login
          repo = UserRepository.new
          user = repo.find_by_email! params.get(:user, :email)
          halt 403 unless user&.valid_password?(params.get(:user, :password))
          return @user = repo.generate_token_for_user(user.id) if user.token.nil?
          @user = user
        rescue RecordNotFoundException => _
          halt 404
        end
      end
    end
  end
end
