require 'sqs'

class ResumesController < ApplicationController

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
    # 2.times { @resume.educations.build }
  end

  def create
    @resume = Resume.new
    @resume.resume_contents = ResumeContent.new(resume_params)

    if @resume.save
      send_message
    else
      redirect_to 'new'
    end

  end

  def update
  end

  def delete
    @resume = Resume.find(params['id'])
    @resume.delete
    redirect_to 'index'
  end

  def show
    @resume = Resume.find(params['id'])
  end



  def resume_params
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, {education: [{}] })#, :experience, :education, :hobbies, :languages, :portfolio_url, :professional_skills)
    # params[:resume][:educations] ||= []
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, educations: [:school, :degree_major, :description_edu], experiences: [:company, :position, :description_exp] )#, :experience, :education, :hobbies, :languages, :portfolio_url, :professional_skills)
    resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, :portfolio_url, experiences: [:company, :position, :description_exp], educations: [:school, :degree_major, :description_edu] )
  end
end
