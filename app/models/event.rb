class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendees, through: :invitations, source: :attendee
end
