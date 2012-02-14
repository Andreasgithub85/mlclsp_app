class ResourcePeriod < ActiveRecord::Base
  belongs_to :resource, :class_name => "Resource"
  belongs_to :period, :class_name => "Period"

  attr_accessible :capacity, :resource_id, :period_id

  validates :capacity, :presence => true,
                   :length => { :maximum => 15 },
                   :numericality => { :only_integer => true}

  validates :resource_id, :presence => true,
                   :length => { :maximum => 15 },
                   :numericality => { :only_integer => true}

  validates :period_id, :presence => true,
                   :length => { :maximum => 15 },
                   :numericality => { :only_integer => true}
end
