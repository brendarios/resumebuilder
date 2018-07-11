class User
  include Dynamoid::Document

  has_one :resume
  
end
