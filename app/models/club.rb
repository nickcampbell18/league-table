class Club < ActiveRecord::Base

  attr_accessible :name, :slug
  validates :name, :presence => true, :length => { :maximum => 30}
  validates :slug, :length => {:maximum => 30}
  before_create :create_slug
  default_scope :order => 'name'
  has_many :teams, :dependent => :destroy
  def to_param
    slug
  end

  def create_slug
    self.slug = self.name.parameterize
  end

end
