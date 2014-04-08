class Link < ActiveRecord::Base
  validates :url, uniqueness: true, :on => :create
  attr_accessible :description, :title, :url, :user_id, :category_id

  belongs_to :category
  belongs_to :user

end
