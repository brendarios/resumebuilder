class ResumeContent


  attr_accessor :first_name, :last_name, :email, :phone, :summary, :school, :hobbies, :degree_major, :description_edu, :education, :position, :company, :description_exp,
  :portfolio_url, :school2, :degree_major2, :description_edu2, :address, :linkedin, :school3, :degree_major3, :description_edu3, :school_location, :school_location2, :school_location3,
  :start_month_edu, :start_month_edu2, :start_month_edu3, :end_month_edu, :end_month_edu2, :end_month_edu3, :start_year_edu, :start_year_edu2, :start_year_edu3, :end_year_edu, :end_year_edu2,
  :end_year_edu3, :company_location, :company_location2, :company_location3, :start_month_exp, :start_month_exp2, :start_month_exp3, :end_month_exp, :end_month_exp2, :end_month_exp3, :start_year_exp, :start_year_exp2, :start_year_exp3, :end_year_exp, :end_year_exp2,
  :end_year_exp3, :company2, :position2, :description_exp2, :company3, :position3, :description_exp3

def initialize(resume_params)
  puts resume_params
  @first_name = resume_params['contact_details']['first_name']
  @last_name = resume_params['contact_details']['last_name']
  @email = resume_params['contact_details']['email']
  @phone = resume_params['contact_details']['phone']
  @address = resume_params['contact_details']['address']
  @linkedin = resume_params['contact_details']['linkedin']
  @summary = resume_params['summary']
  @hobbies = resume_params['hobbies']
  @school = resume_params['educations'][0]['school']
  @degree_major = resume_params['educations'][0]['degree_major']
  @description_edu = resume_params['educations'][0]['description_edu']
  @school_location = resume_params['educations'][0]['school_location']
  @start_month_edu = resume_params['educations'][0]['start_month_edu']
  @end_month_edu = resume_params['educations'][0]['end_month_edu']
  @start_year_edu = resume_params['educations'][0]['start_year_edu']
  @end_year_edu = resume_params['educations'][0]['end_year_edu']
  @school2 = resume_params['educations'][0]['school2']
  @degree_major2 = resume_params['educations'][0]['degree_major2']
  @description_edu2 = resume_params['educations'][0]['description_edu2']
  @school_location2 = resume_params['educations'][0]['school_location2']
  @start_month_edu2 = resume_params['educations'][0]['start_month_edu2']
  @end_month_edu2 = resume_params['educations'][0]['end_month_edu2']
  @start_year_edu2 = resume_params['educations'][0]['start_year_edu2']
  @end_year_edu2 = resume_params['educations'][0]['end_year_edu2']
  @school3 = resume_params['educations'][0]['school3']
  @degree_major3 = resume_params['educations'][0]['degree_major3']
  @description_edu3 = resume_params['educations'][0]['description_edu3']
  @school_location3 = resume_params['educations'][0]['school_location3']
  @start_month_edu3 = resume_params['educations'][0]['start_month_edu3']
  @end_month_edu3 = resume_params['educations'][0]['end_month_edu3']
  @start_year_edu3 = resume_params['educations'][0]['start_year_edu3']
  @end_year_edu3 = resume_params['educations'][0]['end_year_edu3']
  @company = resume_params['experiences'][0]['company']
  @company_location = resume_params['experiences'][0]['company_location']
  @position = resume_params['experiences'][0]['position']
  @description_exp = resume_params['experiences'][0]['description_exp']
  @company2 = resume_params['experiences'][0]['company2']
  @company_location2 = resume_params['experiences'][0]['company_location2']
  @position2 = resume_params['experiences'][0]['position2']
  @description_exp2 = resume_params['experiences'][0]['description_exp2']
  @company3 = resume_params['experiences'][0]['company3']
  @company_location3 = resume_params['experiences'][0]['company_location3']
  @position3 = resume_params['experiences'][0]['position3']
  @description_exp3 = resume_params['experiences'][0]['description_exp3']
  @portfolio_url = resume_params['portfolio_url']
end

# def initialize(resume_params)
#   puts resume_params
#   @first_name = resume_params['contact_details']['first_name']
#   @last_name = resume_params['contact_details']['last_name']
#   @email = resume_params['contact_details']['email']
#   @phone = resume_params['contact_details']['phone']
#   @address = resume_params['contact_details']['address']
#   @linkedin = resume_params['contact_details']['linkedin']
#   @summary = resume_params['summary']
#   @hobbies = resume_params['hobbies']
#   @school = resume_params['educations']['school']
#   @degree_major = resume_params['educations']['degree_major']
#   @description_edu = resume_params['educations']['description_edu']
#   @school_location = resume_params['educations']['school_location']
#   @start_month_edu = resume_params['educations']['start_month_edu']
#   @end_month_edu = resume_params['educations']['end_month_edu']
#   @start_year_edu = resume_params['educations']['start_year_edu']
#   @end_year_edu = resume_params['educations']['end_year_edu']
#   @school2 = resume_params['educations']['school2']
#   @degree_major2 = resume_params['educations']['degree_major2']
#   @description_edu2 = resume_params['educations']['description_edu2']
#   @school_location2 = resume_params['educations']['school_location2']
#   @start_month_edu2 = resume_params['educations']['start_month_edu2']
#   @end_month_edu2 = resume_params['educations']['end_month_edu2']
#   @start_year_edu2 = resume_params['educations']['start_year_edu2']
#   @end_year_edu2 = resume_params['educations']['end_year_edu2']
#   @school3 = resume_params['educations']['school3']
#   @degree_major3 = resume_params['educations']['degree_major3']
#   @description_edu3 = resume_params['educations']['description_edu3']
#   @school_location3 = resume_params['educations']['school_location3']
#   @start_month_edu3 = resume_params['educations']['start_month_edu3']
#   @end_month_edu3 = resume_params['educations']['end_month_edu3']
#   @start_year_edu3 = resume_params['educations']['start_year_edu3']
#   @end_year_edu3 = resume_params['educations']['end_year_edu3']
#   @company = resume_params['experiences']['company']
#   @company_location = resume_params['experiences']['company_location']
#   @position = resume_params['experiences']['position']
#   @description_exp = resume_params['experiences']['description_exp']
#   @company2 = resume_params['experiences']['company2']
#   @company_location2 = resume_params['experiences']['company_location2']
#   @position2 = resume_params['experiences']['position2']
#   @description_exp2 = resume_params['experiences']['description_exp2']
#   @company3 = resume_params['experiences']['company3']
#   @company_location3 = resume_params['experiences']['company_location3']
#   @position3 = resume_params['experiences']['position3']
#   @description_exp3 = resume_params['experiences']['description_exp3']
#   @portfolio_url = resume_params['portfolio_url']
# end

def dynamoid_dump

  # change the string into json
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
      "hobbies": @hobbies,
      "educations" => [
            {
          "school": @school,
          "degree_major": @degree_major,
          "description_edu": @description_edu,
          "school_location": @school_location,
          "start_month_edu": @start_month_edu,
          "end_month_edu": @end_month_edu,
          "start_year_edu": @start_year_edu,
          "end_month_edu": @end_month_edu,
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
          "end_month_edu2": @end_month_edu2,
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
          "end_month_edu3": @end_month_edu3,
          "end_year_edu3": @end_year_edu3
      }


      ],
      "experiences" => [
        {
          "company": @company,
          "position": @position,
          "description_exp": @description_exp
        }
      ],
      "portfolio_url": @portfolio_url


  }
   resume_contents.to_json

end

def self.dynamoid_load(serialized_str)

    ResumeContent.new(JSON.parse(serialized_str))
end


end
