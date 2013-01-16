class Survey < ActiveRecord::Base
  attr_accessible :body, :name, :user
  belongs_to :user
  has_many :blanks

  validates :body, :name, :presence => true
end
