class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(cat_hashes)
    cat_hashes.each do |i, cat_attr|
      if cat_attr[:name].present?
        category = Category.find_or_create_by(name: cat_attr[:name])
        if !self.categories.include?(category)
          # self.categories << category #returns all categories, we'd rather insert a new row in the post_category table to associate them
          self.post_categories.build(category: category)
        end
      end
    end
  end

  def comments_attributes=(comments_attributes)
    comments_attributes.each do |i, comment_attributes|
      self.comments.build(comment_attributes)
    end
  end


end
