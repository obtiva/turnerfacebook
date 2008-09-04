class Attack < ActiveRecord::Base
  belongs_to :attacking_user, :class_name=>"User", :foreign_key=>:attacking_user_id
  belongs_to :defending_user, :class_name=>"User", :foreign_key=>:defending_user_id
  belongs_to :move
  validates_presence_of :attacking_user_id, :defending_user_id, :move
  
  before_create :determine_hit
  
  def determine_hit
    returning true do
      self.hit = (rand(2) == 0)
    end
  end
  
end
