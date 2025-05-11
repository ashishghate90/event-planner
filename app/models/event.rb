class Event < ApplicationRecord
  belongs_to :user
  has_many :event_joiners, dependent: :destroy
  has_many :attendees, through: :event_joiners, source: :user
end
