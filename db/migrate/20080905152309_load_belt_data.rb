class LoadBeltData < ActiveRecord::Migration
  def self.up 
    down 
    directory = File.join(File.dirname(__FILE__), 'dev_data') 
    Fixtures.create_fixtures(directory, "belts") 
  end 
  def self.down 
    Belt.delete_all 
  end
end
