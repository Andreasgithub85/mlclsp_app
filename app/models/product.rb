class Product < ActiveRecord::Base
   has_many :demands, :dependent => :destroy
   has_many :follower_products, :dependent => :destroy

  attr_accessible :product_name, :leadtime_shift, :resource, :setup_time, :setup_cost, :storage_cost, :working_time, :start_inventory

  validates :product_name, :presence => true,
                   :length => { :maximum => 15 },
                   :uniqueness => { :case_sensitive => false }

  validates :leadtime_shift, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => {:only_integer => true}

   validates :resource, :presence => true,
                   :length => { :maximum => 15 }

  validates :setup_time, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => { :only_integer => true}

  validates :setup_cost, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => { :only_integer => true}

  validates :storage_cost, :presence => true,
                   :length => { :maximum => 10 },
                   :numericality => { :only_integer => true}

  validates :working_time, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => { :only_integer => true}

  validates :start_inventory, :presence => true,
                   :length => { :maximum => 5 },
                   :numericality => { :only_integer => true}
end
