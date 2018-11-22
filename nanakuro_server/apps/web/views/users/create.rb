module Web
  module Views
    module Users
      class Create
        include Web::View

        def render
          raw UserSerializer.new(user).to_json
        end
      end
    end
  end
end
