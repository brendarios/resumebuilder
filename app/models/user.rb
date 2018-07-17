class User
  include Dynamoid::Document

  has_one :resume, class: Resume


  def self.get_user(data_hash)


    user = User.where(uid: data_hash['uid']).first
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



 field :uid, :integer
 field :provider, :string
 field :username, :string
 field :email, :string

end
