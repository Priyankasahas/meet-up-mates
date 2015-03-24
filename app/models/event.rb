class Event < ActiveRecord::Base
  belongs_to :group

  validates_presence_of :name
  validates_presence_of :date_and_time
end