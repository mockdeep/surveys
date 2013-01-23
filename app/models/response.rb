class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :blank
  attr_accessible :text

  validates :blank, :presence => true
end
