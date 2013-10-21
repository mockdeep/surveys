class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :blank
  attr_accessible :text, :blank, :user

  delegate :survey, :to => :blank
  validates :blank, :presence => true
end
