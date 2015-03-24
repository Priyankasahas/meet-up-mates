# class AuthenticatesUsers
#   def self.authenticate!(email, password)
#     return nil unless email and password
#
#     user = User.user_by_email(email)
#
#     if user && user.password == password
#       user
#     end
#   end
# end