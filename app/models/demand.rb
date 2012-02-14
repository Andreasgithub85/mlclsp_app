class Demand < ActiveRecord::Base
  belongs_to :product, :class_name => "Product"
  belongs_to :period, :class_name => "Period"

  attr_accessible :product_id, :period_id, :demand_quantity

  validates :product_id, :presence => true,
                   :length => { :maximum => 5 }

  validates :period_id, :presence => true,
                   :length => { :maximum => 5 }

  validates :demand_quantity, :presence => true,
                   :length => { :maximum => 10 },
                   :numericality => { :only_integer => true}

end
