class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post


  def user_attributes=(user_attributes)
    if !user_attributes[:username].empty?
    self.user = User.where(:username => user_attributes[:username]).first_or_create do |u|
      u.username = user_attributes[:username]
      end
    end
  end

end
