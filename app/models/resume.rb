#
# class Resume
#   include Dynamoid::Document
#
#   belongs_to :user
#   field :resume_contents, :serialized
# end



class Resume

  include Dynamoid::Document

  # has_many :educations, inverse_of: :resume
  # accepts_nested_attributes_for :educations
  belongs_to :user
  field :resume_contents, ResumeContent
  field :user_id, User
  field :uid, User
  field :provider, User
  field :username, User
  field :email, User


end
