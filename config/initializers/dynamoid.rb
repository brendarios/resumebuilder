require 'dynamoid'
  Dynamoid.configure do |config|
    config.namespace = nil # To namespace tables created by Dynamoid from other tables you might have. Set to nil to avoid namespacing.
      config.endpoint = 'http://localhost:8000' # [Optional]. If provided, it communicates with the DB listening at the endpoint. This is useful for testing with [Amazon Local DB] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
  end
