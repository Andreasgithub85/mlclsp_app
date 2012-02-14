# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Andreas Gebhardt"
  user.email                 "andgeb@gmx.com"
  user.password              "anderson"
  user.password_confirmation "anderson"
end

Factory.define :demand do |demand|
  demand.product_id       "1"
  demand.period_id        "1"
  demand.demand_quantity  "22"
end

Factory.define :resource do |resource|
   resource.id  "1"
   resource.resource_name "s"
end

Factory.define :product do |product|
   product.id "1"
   product.product_name "s"
   product.leadtime_shift "1"
   product.resource "1"
   product.setup_time  "1"
   product.setup_cost  "1"
   product.storage_cost "1"
   product.working_time "1"
   product.start_inventory  "1"
end

Factory.define :follower do |follower|
   follower.id "1"
   follower.follower_name "2"
end

Factory.define :period do |period|
   period.id        "1"
   period.period_name "1"
end

Factory.define :resource_period do |resource_period|
   resource_period.id   "1"
   resource_period.resource_id "1"
   resource_period.period_id "1"
   resource_period.capacity "1"
end

Factory.define :follower_product do |follower_product|
   follower_product.id      "1"
   follower_product.product_id    "1"
   follower_product.follower_id   "1"
   follower_product.coefficient    "1"
end