
class ResumeConverterJob < ApplicationJob

  queue_as :my_first_queue

  def perform(*resumes)

    puts "hello world"

  end
end
