class Belt < ActiveRecord::Base
  belongs_to :next_belt, :class_name=>"Belt", :foreign_key=>:next_belt_id
  
  def self.initial_belt
    find_by_level(1)
  end
  
  def should_be_upgraded?(user)
    !next_belt.nil? and user.total_hits >= next_belt.minimum_hits
  end
  
end
