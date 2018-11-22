module Web
  module Controllers
    module Users
      class Create
        include Web::Action
        expose :user

        params do
          required(:user).schema do
            required(:email).filled(:str?)
            required(:password).filled(:str?)
            required(:password_confirmation).filled(:str?)
          end
        end

        def call(params)
          halt 422 unless params.valid?
          sign_up
        end

        def sign_up
          repo = UserRepository.new
          halt 401 unless valid_password?
          halt 403, "This email has already been used" if repo.find_by_email(params.get(:user, :email))
          @user = repo.create(user_params)
          self.status = 201
          headers.merge!('Content-Type' => 'application/json')
        end

        private
          def valid_password?
            password = params.get(:user, :password)
            password_confirmation = params.get(:user, :password_confirmation)
            password == password_confirmation
          end

          def user_params
            {
              email: params.get(:user, :email),
              password: Digest::SHA256.hexdigest(params.get(:user, :password)),
              token: SecureRandom.urlsafe_base64(nil, false)
            }
          end
      end
    end
  end
end
