module Aws

require 'time'

def self.init

  if Rails.env.development?

    @client |= Aws::DynamoDB::Client.new(
    endpoint: 'http://localhost:8000'
    region: 'localhost'

    )

  else

    @client ||= Aws::DynamoDB::Client.new(
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      region: AWS_REGION
    )
  end

end
