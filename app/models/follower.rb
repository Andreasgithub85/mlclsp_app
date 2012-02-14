class Follower < ActiveRecord::Base
  has_many :follower_products, :dependent => :destroy

  attr_accessible :follower_name

  validates :follower_name, :presence => true,
                   :length => { :maximum => 15 }

end
