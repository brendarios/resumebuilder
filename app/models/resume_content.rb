class ResumeContent


  attr_accessor :first_name, :last_name, :email, :phone, :summary, :school, :hobbies, :degree_major, :description_edu, :education, :position, :company, :description_exp,
  :portfolio_url

def initialize(resume_params)
  @first_name = resume_params[:contact_details][:first_name]
  @last_name = resume_params[:contact_details][:last_name]
  @email = resume_params[:contact_details][:email]
  @phone = resume_params[:contact_details][:phone]
  @summary = resume_params[:summary]
  @school = resume_params[:educations][:school]
  @hobbies = resume_params[:hobbies]
  @degree_major = resume_params[:educations][:degree_major]
  @description_edu = resume_params[:educations][:description_edu]
  @company = resume_params[:experiences][:company]
  @position = resume_params[:experiences][:position]
  @description_exp = resume_params[:experiences][:description_exp]
  @portfolio_url = resume_params[:portfolio_url]
end

def dynamoid_dump

  # change the string into json
    resume_contents = {
      "contact_details" => {
        "first_name": @first_name,
        "last_name": @last_name,
        "email": @email,
        "phone": @phone

      },
      "summary": @summary,
      "hobbies": @hobbies,
      "educations" => [
            {
          "school": @school,
          "degree_major": @degree_major,
          "description_edu": @description_edu
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

    ResumeContents.new(JSON.parse(serialized_str))
end


end
