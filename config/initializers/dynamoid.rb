require 'dynamoid'
Dynamoid.configure do |config|
config.namespace = nil
config.region = ENV['AWS_REGION'] || 'us-west-2'
config.endpoint = 'https://dynamodb.us-west-2.amazonaws.com'
end
