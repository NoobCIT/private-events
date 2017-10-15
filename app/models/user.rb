class User < ApplicationRecord
  has_many :events, foreign_key: 'host_id', class_name: 'Event'
  has_many :attended_events, through: :invitations, source: :attended_event
end
