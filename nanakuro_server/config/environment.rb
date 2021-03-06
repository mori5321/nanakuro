require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/nanakuro_server'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/nanakuro_server_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/nanakuro_server_development'
    #    adapter :sql, 'mysql://localhost/nanakuro_server_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')
    # adapter :sql, 'mysql://localhost/nanakuro_server_development'

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/nanakuro_server/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
