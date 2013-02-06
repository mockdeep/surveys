class Survey < ActiveRecord::Base
  include ActionView::Helpers::FormHelper

  attr_accessible :body, :name, :user
  belongs_to :user
  has_many :blanks, :dependent => :destroy

  validates :body, :name, :presence => true

  def body=(new_body)
    super
    if new_body.nil?
      self.parsed_body = nil
      return
    end
    new_body = sanitize(new_body)
    tags = new_body.scan(/_\w+_/)
    tags.each do |tag|
      new_body = new_body.sub(tag, text_field_tag(tag.humanize.strip))
    end
    self.parsed_body = new_body
  end
end
