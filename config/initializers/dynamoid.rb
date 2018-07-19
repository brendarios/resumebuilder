require 'dynamoid'
  Dynamoid.configure do |config|
    config.namespace = nil # To namespace tables created by Dynamoid from other tables you might have. Set to nil to avoid namespacing.
    config.region = ENV['AWS_REGION'] || 'us-west-2'
    if ENV['DYNAMODB_ENDPOINT'].present?
      config.endpoint = ENV['DYNAMODB_ENDPOINT'] # [Optional]. If provided, it communicates with the DB listening at the endpoint. This is useful for testing with [Amazon Local DB] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
    end

  end
