class Blank < ActiveRecord::Base
  attr_accessible :name, :survey

  belongs_to :survey
  has_many :responses, :dependent => :destroy

  validates :name, :survey, :presence => true
end
