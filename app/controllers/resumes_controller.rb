require 'sqs'

class ResumesController < ApplicationController

  def sections

  end

  def contact_details
    # @resume = Resume.new

    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    # @resume = current_user.get_resume @todo
    # @resume = Resume.new if @resume.nil?
    p @resume

    # resume.resume_contents.first_name

  end

  def update_contact_details
    puts params

    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    # @resume = Resume.find(params[:id]) @todo
    # puts @resume.resume_contents.contact_details

    # @resume.resume_contents.first_name

    @resume.resume_contents.first_name = params[:resume][:first_name]
    @resume.resume_contents.last_name = params[:resume][:last_name]
    @resume.resume_contents.email = params[:resume][:email]
    @resume.resume_contents.phone = params[:resume][:phone]
    @resume.save

    redirect_to :sections
  end

  def summary
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
  end


  def update_summary

    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    @resume.resume_contents.summary = params[:resume][:summary]
    @resume.save

    redirect_to :sections
  end

  def education

    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
  end

  def update_education

    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    @resume.resume_contents.school = params[:resume][:school]
    @resume.resume_contents.degree_major = params[:resume][:degree_major]
    @resume.resume_contents.description_edu = params[:resume][:description_edu]

    @resume.save

    redirect_to :sections
  end

  def experience
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
  end

  def update_experience
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    @resume.resume_contents.company = params[:resume][:company]
    @resume.resume_contents.position = params[:resume][:position]
    @resume.resume_contents.description_exp = params[:resume][:description_exp]

    @resume.save

    redirect_to :sections
  end

  def build_resume
  end

  def hobbies
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')

  end

  def update_hobbies

    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    @resume.resume_contents.hobbies = params[:resume][:hobbies]
    @resume.save

    redirect_to :sections

  end

  def others
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
  end

  def update_others
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    @resume.resume_contents.portfolio_url = params[:resume][:portfolio_url]
    @resume.save

    redirect_to :sections

  end
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new

  end

  def create
    @resume = Resume.new
    @resume.resume_contents = ResumeContent.new(resume_params)

    if @resume.save
      send_message
      redirect_to new_resume_path
    else
      redirect_to :new
    end

  end

  def update
  end

  def delete
    @resume = Resume.find(params['id'])
    @resume.delete
    redirect_to 'index'
  end

  # def show
  #   @resume = Resume.find(params['id'])
  # end

  def show
    @resume = Resume.find('33308c95-2f1d-413f-b241-52711e23a6f0')
    # respond_to do |format|
    #   format.html
    #   format.json
  end




  def resume_params
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, {education: [{}] })#, :experience, :education, :hobbies, :languages, :portfolio_url, :professional_skills)
    # params[:resume][:educations] ||= []
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, educations: [:school, :degree_major, :description_edu], experiences: [:company, :position, :description_exp] )#, :experience, :education, :hobbies, :languages, :portfolio_url, :professional_skills)
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, :portfolio_url, experiences: [:company, :position, :description_exp], educations: [:school, :degree_major, :description_edu, :school2, :degree_major2, :description_edu2] )
    resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, :portfolio_url, experiences: [:company, :position, :description_exp], educations: [:school, :degree_major, :description_edu] )
  end
end
