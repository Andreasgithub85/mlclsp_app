class Period < ActiveRecord::Base
  has_many :demands, :dependent => :destroy
  has_many :resource_periods, :dependent => :destroy

  attr_accessible :period_name

  validates :period_name, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => { :only_integer => true}
end
