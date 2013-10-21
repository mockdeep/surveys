class Survey < ActiveRecord::Base
  include ActionView::Helpers::FormHelper

  attr_accessible :body, :name, :user
  belongs_to :user
  has_many :blanks, :dependent => :destroy
  after_save :create_blanks

  validates :body, :name, :presence => true

  def body=(new_body)
    super
    if new_body.nil?
      self.parsed_body = nil
      return
    end
    new_body = sanitize(new_body)
    tags.each do |tag|
      new_body = new_body.sub(tag, text_field_tag(tag.
        humanize.strip))
    end
    self.parsed_body = new_body
  end

  def tags
     sanitize(body).scan(/_\w+_/)
  end

  def create_blanks
    tags.each do |tag|
      blanks.where(:name => tag[1..-2]).first_or_create
    end
  end
end
