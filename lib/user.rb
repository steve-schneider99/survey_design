class User < ActiveRecord::Base
  belongs_to(:survey)

end
