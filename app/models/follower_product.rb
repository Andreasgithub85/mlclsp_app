class FollowerProduct < ActiveRecord::Base
  belongs_to :follower, :class_name => "Follower"
  belongs_to :product, :class_name => "Product"

  attr_accessible :coefficient, :follower_id, :product_id

  validates :coefficient, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => { :only_integer => true}

  validates :follower_id, :presence => true,
                   :length => { :maximum => 5 }

  validates :product_id, :presence => true,
                   :length => { :maximum => 5 }
end
