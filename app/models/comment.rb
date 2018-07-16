class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post


  def user_attributes=(user_attributes)
    self.user = User.where(:id => user_attributes[:user_id]).first_or_create do |u|
      u.username = user_attributes[:username]
    end
  end

end
