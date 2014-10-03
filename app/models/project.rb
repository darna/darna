class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :user
  has_many :things
end
