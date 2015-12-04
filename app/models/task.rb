class Task < ActiveRecord::Base

belongs_to :todoodle
validates_presence_of :item

end
