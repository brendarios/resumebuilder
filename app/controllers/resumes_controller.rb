require 'sqs'

class ResumesController < ApplicationController
  before_action :set_resume , only:[:contact_details, :update_contact_details, :summary, :update_summary,
    :education, :update_education, :experience, :update_experience, :hobbies, :update_hobbies, :others, :update_others, :skills, :update_skills]

    layout :resolve_layout


    def resolve_layout
      case action_name
      when "show"
        "pdf"
      else
        "application"
      end
    end

    def sections

    end

    def set_resume
      if session[:uid]
        @resume = Resume.find_by_user_uid(session[:uid])
      else
        if session[:resume_id]
          @resume = Resume.find(session[:resume_id])
        else
          @resume = Resume.new
          @resume.resume_contents = ResumeContent.new

        end
      end
    end


    def contact_details
      # puts session[:resume_id]
    end

    def set_anonymous_resume_id
      if !session[:uid] && !session[:resume_id]
        session[:resume_id] = @resume.id
      end
    end

    def update_contact_details


      if @resume.nil?
        @resume = Resume.new
        @resume.resume_contents = ResumeContent.new(resume_params)
        @resume.resume_contents.first_name = params[:resume][:first_name]
        @resume.resume_contents.last_name = params[:resume][:last_name]
        @resume.resume_contents.email = params[:resume][:email]
        @resume.resume_contents.phone = params[:resume][:phone]
        @resume.resume_contents.address = params[:resume][:address]
        @resume.resume_contents.linkedin = params[:resume][:linkedin]
        @resume.save



        redirect_to :sections

      else
        @resume.resume_contents.first_name = params[:resume][:first_name]
        @resume.resume_contents.last_name = params[:resume][:last_name]
        @resume.resume_contents.email = params[:resume][:email]
        @resume.resume_contents.phone = params[:resume][:phone]
        @resume.resume_contents.address = params[:resume][:address]
        @resume.resume_contents.linkedin = params[:resume][:linkedin]
        @resume.save

        # set_anonymous_resume_id
        # puts "session despeus del anonymous"
        # puts session[:resume_id]
        redirect_to :sections
      end

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
      @resume.resume_contents.start_month_edu = params[:resume][:start_month_edu]
      @resume.resume_contents.end_month_edu = params[:resume][:end_month_edu]
      @resume.resume_contents.start_year_edu = params[:resume][:start_year_edu]
      @resume.resume_contents.end_year_edu = params[:resume][:end_year_edu]

      @resume.resume_contents.school2 = params[:resume][:school2]
      @resume.resume_contents.degree_major2 = params[:resume][:degree_major2]
      @resume.resume_contents.description_edu2 = params[:resume][:description_edu2]
      @resume.resume_contents.school_location2 = params[:resume][:school_location2]
      @resume.resume_contents.start_month_edu2 = params[:resume][:start_month_edu2]
      @resume.resume_contents.end_month_edu2 = params[:resume][:end_month_edu2]
      @resume.resume_contents.start_year_edu2 = params[:resume][:start_year_edu2]
      @resume.resume_contents.end_year_edu2 = params[:resume][:end_year_edu2]


      @resume.resume_contents.school3 = params[:resume][:school3]
      @resume.resume_contents.degree_major3 = params[:resume][:degree_major3]
      @resume.resume_contents.description_edu3 = params[:resume][:description_edu3]
      @resume.resume_contents.school_location3 = params[:resume][:school_location3]
      @resume.resume_contents.start_month_edu3 = params[:resume][:start_month_edu3]
      @resume.resume_contents.end_month_edu3 = params[:resume][:end_month_edu3]
      @resume.resume_contents.start_year_edu3 = params[:resume][:start_year_edu3]
      @resume.resume_contents.end_year_edu3 = params[:resume][:end_year_edu3]
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

      @resume.resume_contents.company2 = params[:resume][:company2]
      @resume.resume_contents.company_location2 = params[:resume][:company_location2]
      @resume.resume_contents.position2 = params[:resume][:position2]
      @resume.resume_contents.description_exp2 = params[:resume][:description_exp2]

      @resume.resume_contents.company3 = params[:resume][:company3]
      @resume.resume_contents.company_location3 = params[:resume][:company_location3]
      @resume.resume_contents.position3 = params[:resume][:position3]
      @resume.resume_contents.description_exp3 = params[:resume][:description_exp3]

      @resume.save

      redirect_to :sections
    end


    def build_resume
      if session[:uid]
        @resume = Resume.find_by_user_uid(session[:uid])
      # else
      #   @resume = Resume.find_by_id(params[:id])
      end
      # send_message
      ResumeConverterJob.perform_later({resume_id: @resume.id})
    end

    def hobbies

    end

    def update_hobbies
      @resume.resume_contents.hobbies = params[:resume][:hobbies]
      @resume.save

      redirect_to :sections

    end

    def skills

    end

    def update_skills

      @resume.resume_contents.languages = params[:resume][:languages]
      @resume.resume_contents.databases = params[:resume][:databases]
      @resume.resume_contents.frameworks = params[:resume][:frameworks]
      @resume.resume_contents.cloud_tools = params[:resume][:cloud_tools]
      @resume.save

      redirect_to :sections

    end

    def others

    end

    def update_others

      @resume.resume_contents.portfolio_url = params[:resume][:portfolio_url]
      @resume.resume_contents.github = params[:resume][:github]
      @resume.resume_contents.hobbies = params[:resume][:hobbies]
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
        # send_message
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

      resume = params.require(:resume).permit(:id, :user_uid, :github, { contact_details: {} }, :summary, :hobbies, :languages, :frameworks, :cloud_tools, :databases,
        experiences: [:company, :position, :description_exp, :company_location, :company2, :position2, :description_exp2, :company_location2, :company3, :position3, :description_exp3, :company_location3, ],
        educations: [:school, :degree_major, :description_edu, :school_location, :school2, :school3,:degree_major2, :degree_major3,:school_location2, :school_location3,
        :description_edu2,:description_edu3, :start_month_edu, :start_year_edu, :start_month_edu2, :start_year_edu2,:start_month_edu3, :start_year_edu3, :end_month_edu, :end_year_edu,:end_month_edu2,
        :end_year_edu2,:end_month_edu3, :end_year_edu3, ] )
      end
    end
