class ResumeConverterJob < ApplicationJob

  queue_as :my_first_queue

  def perform(*resumes)
    resumes.each do |resume|


      # pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
      # pdf = WickedPdf.new.pdf_from_url('http://localhost:3000/resumes/33308c95-2f1d-413f-b241-52711e23a6f0')
      pdf = WickedPdf.new.pdf_from_url('http://builderesume-env-1.pnfmvibna9.us-west-2.elasticbeanstalk.com/resumes/'+resume[:id])
    # pdf = WickedPdf.new.pdf_from_html_file('http://localhost:3000/resumes/33308c95-2f1d-413f-b241-52711e23a6f0')


      save_path = '/tmp/file2.pdf'
      File.open(save_path, 'wb') do |file|

        file << pdf
      end

      s3 = Aws::S3::Resource.new(region: 'us-west-2')
      s3.bucket('resumesproject').object('pdf').upload_file('/tmp/file2.pdf')

      # delete file from computer
      File.delete('/tmp/file2.pdf')
    end
  end


end
