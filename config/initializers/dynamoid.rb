require 'dynamoid'

  Dynamoid.configure do |config|
    config.access_key = 'AWS_ACCESS_KEY_ID'
    config.secret_key = 'AWS_SECRET_ACCESS_KEY'
    config.namespace = nil # To namespace tables created by Dynamoid from other tables you might have. Set to nil to avoid namespacing.
    config.region = ENV['AWS_REGION'] || 'us-west-2'
    if ENV['DYNAMODB_ENDPOINT'].present?
      config.endpoint = ENV['DYNAMODB_ENDPOINT'] # [Optional]. If provided, it communicates with the DB listening at the endpoint. This is useful for testing with [Amazon Local DB] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
    else
      config.endpoint = 'https://dynamodb.us-west-2.amazonaws.com'
    end

  end

# DYNAMODB_ENDPOINT = http://localhost:8000
