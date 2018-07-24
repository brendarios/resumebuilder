require 'wicked_pdf'

class ResumeConverterJob < ApplicationJob

  queue_as :my_first_queue

  def perform(*resumes)
    resumes.each do |resume|
      puts "hello world"

      # resume_pdf = WickedPdf.new.pdf_from_url('http://builderesume-env-1.pnfmvibna9.us-west-2.elasticbeanstalk.com/resumes/:id')
      resume_pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')

      save_path = '/tmp/file2.pdf'
      File.open(save_path, 'wb') do |file|

        file << pdf
      end
      s3 = Aws::S3::Resource.new(region: 'us-west-2')
      s3.bucket('resumesproject').object('resume_pdf').upload_file(save_path)

      # delete file from computer
      File.delete(save_path)


    end

  end
end
