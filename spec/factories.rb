# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Andreas Gebhardt"
  user.email                 "andgeb@gmx.com"
  user.password              "anderson"
  user.password_confirmation "anderson"
end