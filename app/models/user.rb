class User
  include Dynamoid::Document

  has_one :resume


  def self.get_user(data_hash)
    user = User.find_by_uid(data_hash['uid'])
    # user = data_hash['uid']
    if user.nil?
      user_data = {
        uid: data_hash['uid'],
        provider: data_hash['provider'],
        username: data_hash['info']['name'],
        email: data_hash['info']['email']
      }

      user = User.new(user_data)
      return user.save ? user : nil
    end
    return user
  end



 # field :uid
 # field :provider
 # field :username
 # field :email
 # field :current_user
end
