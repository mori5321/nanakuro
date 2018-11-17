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
          user = repo.find_by_email! params.get(:user, )
        end
      end
    end
  end
end
