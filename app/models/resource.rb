class Resource < ActiveRecord::Base
  has_many :resource_periods, :dependent => :destroy

  attr_accessible :resource_name

  validates :resource_name, :presence => true,
                   :length => { :maximum => 15 },
                   :uniqueness => { :case_sensitive => false }
end
