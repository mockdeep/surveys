class Blank < ActiveRecord::Base
  attr_accessible :name, :survey

  belongs_to :survey
  has_many :responses

  validates :name, :survey, :presence => true
end
