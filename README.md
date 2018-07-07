# Resume Builder

## Objective
User will be able to build a resume using a template and receive and email with a link to a PDF saved in Amazon S3.

## Technologies

### Back-end Technology
  - Ruby on Rails with at least five additional gems: 
      - Wicked_Pdf and wkhtmltopdf: to convert to PDF format
      - Dynamoid: ORM for Amazon's DynamoDB for Ruby applications
      - aws-sdk: simplifies using AWS services with an API tailored. 
  - DynamoDB
  
### Front-end Technology
  - HTML and CSS rendered server side
  
### Infrastructure 
  - Amazon SQS
  - Amazon S3
  
### For the Rails App

#### AWS Configuration 
Create config/initializers/aws.rb with:

 ```ruby

  Aws.config.update({
    region: 'us-west-2',
    credentials: Aws::Credentials.new('REPLACE_WITH_ACCESS_KEY_ID', 'REPLACE_WITH_SECRET_ACCESS_KEY'),
  })

```
 #### Dynamoid Configuration 
 Create config/initializers/dynamoid.rb with:
 ```ruby
  require 'dynamoid'
  Dynamoid.configure do |config|
    config.access_key = 'REPLACE_WITH_ACCESS_KEY_ID'
    config.secret_key = 'REPLACE_WITH_SECRET_ACCESS_KEY'
    config.region = 'us-west-2'
  end
 ```

#### Set up
You *must* include `Dynamoid::Document` in every Dynamoid model.

```ruby
class Resume
  include Dynamoid::Document

end
```
### For the Resume Maker (background worker)

- Create a queue in AWS Console
- Create worker outside your rails app -- 
   ```resume_converter.rb```

- Install gems to convert to pdf in your system 
- Use this documentation for the code of receiving a message : 
https://github.com/awsdocs/aws-doc-sdk-examples/blob/master/ruby/example_code/sqs/sqs-ruby-example-send-receive-messages.rb
