require 'sqs'

class ResumesController < ApplicationController

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

  # def show
  #   @resume = Resume.find(params['id'])
  # end

  def show
    respond_to do |format|
      format.html
      format.json

    end
  end




  def resume_params
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, {education: [{}] })#, :experience, :education, :hobbies, :languages, :portfolio_url, :professional_skills)
    # params[:resume][:educations] ||= []
    # resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, educations: [:school, :degree_major, :description_edu], experiences: [:company, :position, :description_exp] )#, :experience, :education, :hobbies, :languages, :portfolio_url, :professional_skills)
    resume = params.require(:resume).permit({ contact_details: {} }, :summary, :hobbies, :portfolio_url, experiences: [:company, :position, :description_exp], educations: [:school, :degree_major, :description_edu, :school2, :degree_major2, :description_edu2] )
  end
end
