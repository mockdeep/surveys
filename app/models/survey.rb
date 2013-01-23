class Survey < ActiveRecord::Base
  attr_accessible :body, :name, :user
  belongs_to :user
  has_many :blanks, :dependent => :destroy

  validates :body, :name, :presence => true
end
