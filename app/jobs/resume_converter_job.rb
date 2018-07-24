
class ResumeConverterJob < ApplicationJob

  queue_as :my_first_queue

  def perform(*resumes)
    resumes.each do |resume|
      puts "hello world"
    end

  end
end
