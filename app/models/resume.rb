#
# class Resume
#   include Dynamoid::Document
#
#   belongs_to :user
#   field :resume_contents, :serialized
# end



class Resume

  include Dynamoid::Document


  # accepts_nested_attributes_for :educations
  belongs_to :user, class: User, foreign_key: :user_uid

  field :resume_contents, ResumeContent


  field :user_uid, :integer
  # field :uid, :integer
  # field :provider, User
  # field :username, User
  # field :email, User


end
