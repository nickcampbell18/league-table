class Team < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true, :length => { :is => 1} #One letter length
  validates_format_of :name, :with => /^[A-Z]$/ #Formatted as a word
  validates_uniqueness_of :name, :scope => :club_id #Must not already be taken
  belongs_to :club
  default_scope :order => 'name'
  def to_param
    name.downcase
  end
end
