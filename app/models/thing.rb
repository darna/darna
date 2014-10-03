class Thing < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :project
end
