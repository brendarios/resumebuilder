require 'sqs'

class ResumesController < ApplicationController
  before_action :set_resume , only:[:contact_details, :update_contact_details, :summary, :update_summary,
  :education, :update_education, :experience, :update_experience, :hobbies, :update_hobbies, :others, :update_others]


  def sections

  end

  def set_resume
    if session[:uid]
      @resume = Resume.find_by_user_uid(session[:uid])
    else
      @resume = Resume.new
    end
  end

  def contact_details

  end

  def update_contact_details

    @resume.resume_contents.first_name = params[:resume][:first_name]
    @resume.resume_contents.last_name = params[:resume][:last_name]
    @resume.resume_contents.email = params[:resume][:email]
    @resume.resume_contents.phone = params[:resume][:phone]
    @resume.resume_contents.address = params[:resume][:address]
    @resume.save

    redirect_to :sections
  end

  def summary

  end


  def update_summary

    @resume.resume_contents.summary = params[:resume][:summary]
    @resume.save

    redirect_to :sections
  end


  def education
  end

  def update_education

    @resume.resume_contents.school = params[:resume][:school]
    @resume.resume_contents.degree_major = params[:resume][:degree_major]
    @resume.resume_contents.description_edu = params[:resume][:description_edu]
    @resume.resume_contents.school_location = params[:resume][:school_location]

    @resume.resume_contents.school2 = params[:resume][:school2]
    @resume.resume_contents.degree_major2 = params[:resume][:degree_major2]
    @resume.resume_contents.description_edu2 = params[:resume][:description_edu2]
    @resume.resume_contents.school_location2 = params[:resume][:school_location2]

    @resume.resume_contents.school3 = params[:resume][:school3]
    @resume.resume_contents.degree_major3 = params[:resume][:degree_major3]
    @resume.resume_contents.description_edu3 = params[:resume][:description_edu3]
    @resume.resume_contents.school_location3 = params[:resume][:school_location3]

    @resume.save

    redirect_to :sections
  end

  def experience

  end

  def update_experience

    @resume.resume_contents.company = params[:resume][:company]
    @resume.resume_contents.company_location = params[:resume][:company_location]
    @resume.resume_contents.position = params[:resume][:position]
    @resume.resume_contents.description_exp = params[:resume][:description_exp]

    @resume.save

    redirect_to :sections
  end

  def build_resume
  end

  def hobbies

  end

  def update_hobbies
    @resume.resume_contents.hobbies = params[:resume][:hobbies]
    @resume.save

    redirect_to :sections

  end

  def others

  end

  def update_others

    @resume.resume_contents.portfolio_url = params[:resume][:portfolio_url]
    @resume.save

    redirect_to :sections
  end

  def index
    @resumes = Resume.all
  end

  def new

    if session[:uid]

      @resume = Resume.find_by_user_uid(session[:uid])
    else
      @resume = Resume.new
    end
  end

  def create

    @resume = Resume.new
    @resume.resume_contents = ResumeContent.new(resume_params)


    @resume.user_uid = session[:uid]

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
    redirect_to :index
  end

  # def show
  #   @resume = Resume.find(params['id'])
  # end

  def show
    if session[:uid]
      @resume = Resume.find_by_user_uid(session[:uid])
    else
      @resume = Resume.find_by_id(params[:id])
    end
  end


  def resume_params

    resume = params.require(:resume).permit(:id, :user_uid, { contact_details: {} }, :summary, :hobbies, :portfolio_url, experiences: [:company, :position, :description_exp, :company_location], educations: [:school, :degree_major, :description_edu, :school_location, :school2, :school3, :degree_major2, :degree_major3, :school_location2, :school_location3, :description_edu2,
       :description_edu3, :start_month_edu, :start_year_edu, :start_month_edu2, :start_year_edu2, :start_month_edu3, :start_year_edu3, :end_month_edu, :end_year_edu,:end_month_edu2, :end_year_edu2,:end_month_edu3, :end_year_edu3, ] )
  end
end
