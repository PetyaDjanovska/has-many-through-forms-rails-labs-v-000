class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post


  def user_attributes=(user_attributes)
    byebug
    if user_attributes[:username].empty?
      self.user = User.where(:id => user_attributes[:user_id])
    else
      self.user = User.created(:username => user_attributes[:username])
    end
  end

end
