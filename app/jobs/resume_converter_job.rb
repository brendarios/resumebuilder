require 'wicked_pdf'

class ResumeConverterJob < ApplicationJob

  queue_as :my_first_queue

  def perform(*resumes)
    resumes.each do |resume|
      puts "hello world"

      pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')

      save_path = '/tmp/file2.pdf'
      File.open(save_path, 'wb') do |file|

        file << pdf
      end


    end

  end
end
