class User < ActiveRecord::Base
  acts_as_authentic do |f|
    f.login_field = :name
  end
has_many :todoodles, dependent: :destroy

end
