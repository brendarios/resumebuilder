require 'aws-sdk'  # v2: require 'aws-sdk'

def send_message
  sqs = Aws::SQS::Client.new(region: ENV['AWS_REGION'])

  # Send a message to a queue.
  queue_name = "my_first_queue"

  begin
    queue_url = sqs.get_queue_url(queue_name: queue_name).queue_url

    # Create a message with three custom attributes: Title, Author, and WeeksOn.
    send_message_result = sqs.send_message({
      queue_url: queue_url,
      {message: "Converting the resume template into a pdf file"},
      message_attributes: {
        "UserEmail" => {
          string_value: "tadeo.perez@gmail.com",
          data_type: "String"
        },
        "Author" => {
          string_value: "John Grisham",
          data_type: "String"
        },
        "WeeksOn" => {
          string_value: "6",
          data_type: "Number"
        }
      }
      })
    rescue Aws::SQS::Errors::NonExistentQueue
      puts "A queue named '#{queue_name}' does not exist."
      exit(false)
    end

    puts send_message_result.message_id
  end
