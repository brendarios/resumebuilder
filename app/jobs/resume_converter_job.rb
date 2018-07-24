require 'aws-sdk'
require 'wicked_pdf'




class ResumeConverterJob < ApplicationJob

  queue_as :my_first_queue

  def perform(*resumes)

    Aws.config.update({
       region: 'us-west-2',
       credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
     })


    sender = 'newintechresumebuilder@gmail.com'

    # Replace recipient@example.com with a "To" address. If your account
    # is still in the sandbox, this address must be verified.
    recipient = 'riosbrenda@gmail.com'

    # Specify a configuration set. To use a configuration
    # set, uncomment the next line and line 74.
    #   configsetname = "ConfigSet"

    # The subject line for the email.
    subject = 'Hello from newFishInTech Resume Builder '

    # The HTML body of the email.
    htmlbody =
    # '<h1>Amazon SES test (AWS SDK for Ruby)</h1>'\
    # '<p>This email was sent with <a href="https://aws.amazon.com/ses/">'\
    # 'Amazon SES</a> using the <a href="https://aws.amazon.com/sdk-for-ruby/">'\
    # 'AWS SDK for Ruby</a>.
    '
    <p>Hi!</p>
    <p>You can download your resume from this link https://s3-us-west-2.amazonaws.com/resumesproject/pdf </p>
    <p>It will be temporally available for 7 days </p>
    <strong>Thank you for choosing newInTech Resume Builder! </strong>'

    # el link a lo mejor  puede ser con una variable el nombre del pdf que provenga de arriba
    # donde se genera



    # The email body for recipients with non-HTML email clients.
    textbody = 'https://s3-us-west-2.amazonaws.com/resumesproject/pdf'

    # Specify the text encoding scheme.
    encoding = 'UTF-8'

    # Create a new SES client in the us-west-2 region.
    # Replace us-west-2 with the AWS Region you're using for Amazon SES.
    ses = Aws::SES::Client.new(region: 'us-west-2')

    # Try to send the email.
    begin
      # Provide the contents of the email.
      ses.send_email(
        destination: {
          to_addresses: [
            recipient
          ]
        },
        message: {
          body: {
            html: {
              charset: encoding,
              data: htmlbody
            },
            text: {
              charset: encoding,
              data: textbody
            }
          },
          subject: {
            charset: encoding,
            data: subject
          }
        },
        source: sender,
        # Uncomment the following line to use a configuration set.
        # configuration_set_name: configsetname,
      )

      puts 'Email sent to ' + recipient


      # If something goes wrong, display an error message.
    rescue Aws::SES::Errors::ServiceError => error
      puts "Email not sent. Error message: #{error}"
    end

  end
end
