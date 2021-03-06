class ResumeContent


  attr_accessor :first_name, :last_name, :email, :phone, :summary, :school, :hobbies, :degree_major, :description_edu, :educations, :experiences, :position, :company, :description_exp,
  :portfolio_url, :school2, :degree_major2, :description_edu2, :address, :linkedin, :school3, :degree_major3, :description_edu3, :school_location, :school_location2, :school_location3,
  :start_month_edu, :start_month_edu2, :start_month_edu3, :end_month_edu, :end_month_edu2, :end_month_edu3, :start_year_edu, :start_year_edu2, :start_year_edu3, :end_year_edu, :end_year_edu2,
  :end_year_edu3, :company_location, :company_location2, :company_location3, :start_month_exp, :start_month_exp2, :start_month_exp3, :end_month_exp, :end_month_exp2, :end_month_exp3, :start_year_exp, :start_year_exp2, :start_year_exp3, :end_year_exp, :end_year_exp2,
  :end_year_exp3, :company2, :position2, :description_exp2, :company3, :position3, :description_exp3, :skills, :languages, :databases, :frameworks, :cloud_tools, :github

  def initialize(resume_params)
    puts resume_params
    unless resume_params.blank?
      @first_name = resume_params['contact_details']['first_name']
      @last_name = resume_params['contact_details']['last_name']
      @email = resume_params['contact_details']['email']
      @phone = resume_params['contact_details']['phone']
      @address = resume_params['contact_details']['address']
      @linkedin = resume_params['contact_details']['linkedin']
      @summary = resume_params['summary']
      @hobbies = resume_params['hobbies']
      @portfolio_url = resume_params['portfolio_url']
      @educations = resume_params['educations']
      @experiences = resume_params['experiences']
      @languages = resume_params['languages']
      @databases = resume_params['databases']
      @frameworks = resume_params['frameworks']
      @cloud_tools = resume_params['cloud_tools']
      @github = resume_params['github']
    end
  end

  # def initialize
  # end


  def dynamoid_dump

    resume_contents = {
      "contact_details" => {
        "first_name": @first_name,
        "last_name": @last_name,
        "email": @email,
        "phone": @phone,
        "address": @address,
        "linkedin": @linkedin

      },
      "summary": @summary,

      "languages": @languages,
      "databases": @databases,
      "frameworks": @frameworks,
      "cloud_tools": @cloud_tools,


      "educations" => [
        {
          "school": @school,
          "degree_major": @degree_major,
          "description_edu": @description_edu,
          "school_location": @school_location,
          "start_month_edu": @start_month_edu,
          "end_month_edu": @end_month_edu,
          "start_year_edu": @start_year_edu,
          "end_year_edu": @end_year_edu
        },
        {
          "school2": @school2,
          "degree_major2": @degree_major2,
          "description_edu2": @description_edu2,
          "school_location2": @school_location2,
          "start_month_edu2": @start_month_edu2,
          "end_month_edu2": @end_month_edu2,
          "start_year_edu2": @start_year_edu2,
          "end_year_edu2": @end_year_edu2
        },
        {
          "school3": @school3,
          "degree_major3": @degree_major3,
          "description_edu3": @description_edu3,
          "school_location3": @school_location3,
          "start_month_edu3": @start_month_edu3,
          "end_month_edu3": @end_month_edu3,
          "start_year_edu3": @start_year_edu3,
          "end_year_edu3": @end_year_edu3
        }


      ],
      "experiences" => [
        {
          "company": @company,
          "position": @position,
          "description_exp": @description_exp
        },
        {
          "company2": @company2,
          "position2": @position2,
          "description_exp2": @description_exp2,
          "company_location2": @company_location2,
          "start_month_exp2": @start_month_exp2,
          "end_month_exp2": @end_month_exp2,
          "start_year_exp2": @start_year_exp2,
          "end_year_exp2": @end_year_exp2
        },
        {
          "company3": @company3,
          "position3": @position3,
          "description_exp3": @description_exp3,
          "company_location3": @company_location3,
          "start_month_exp3": @start_month_exp3,
          "end_month_exp3": @end_month_exp3,
          "start_year_exp3": @start_year_exp3,
          "end_year_exp3": @end_year_exp3
        }
      ],
      "portfolio_url": @portfolio_url,
      "github": @github,
      "hobbies": @hobbies,
    }
    resume_contents.to_json

  end

  def self.dynamoid_load(serialized_str)
    if serialized_str.nil?
      ResumeContent.new
    else
      ResumeContent.new(JSON.parse(serialized_str))
    end
  end


end
