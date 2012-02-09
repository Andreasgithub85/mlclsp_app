class Resource < ActiveRecord::Base
  has_many :resource_periods, :dependent => :destroy
end
