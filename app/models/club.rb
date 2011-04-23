class Club < ActiveRecord::Base
  before_create :create_slug

  attr_accessible :name, :slug
  validates :name, :presence => true, :length => { :maximum => 30}
  validates :slug, :length => {:maximum => 30}
  
  def to_param
    slug
  end

  def create_slug
    self.slug = self.name.parameterize
  end

end
