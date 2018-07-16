class ResumeContent


  attr_accessor :first_name, :last_name, :email, :phone, :summary, :school, :hobbies, :degree_major, :description_edu, :education, :position, :company, :description_exp,
  :portfolio_url, :school2, :degree_major2, :description_edu2, :address, :linkedin

def initialize(resume_params)
  puts resume_params
  @first_name = resume_params['contact_details']['first_name']
  @last_name = resume_params['contact_details']['last_name']
  @email = resume_params['contact_details']['email']
  @phone = resume_params['contact_details']['phone']
  @address = resume_params['contact_details']['address']
  @linkedin = resume_params['contact_details']['linkedin']
  @summary = resume_params['summary']
  @school = resume_params['educations'][0]['school']
  @hobbies = resume_params['hobbies']
  @degree_major = resume_params['educations'][0]['degree_major']
  @description_edu = resume_params['educations'][0]['description_edu']
  @company = resume_params['experiences'][0]['company']
  @position = resume_params['experiences'][0]['position']
  @description_exp = resume_params['experiences'][0]['description_exp']
  @portfolio_url = resume_params['portfolio_url']
end

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
          "description_edu": @description_edu
        },


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
