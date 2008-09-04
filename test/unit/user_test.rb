require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_hometown_when_exists 
    location=Facebooker::Location.new(:city=>"Westerville", :state=>"Ohio") 
    fm=flexmock(Facebooker::User) 
    fm.new_instances.should_receive(:hometown_location).and_return(location) 
    mike=users(:mike) 
    assert_equal "Westerville Ohio",mike.hometown 
  end

  def test_hometown_when_blank 
    location=Facebooker::Location.new(:city=>"", :state=>"") 
    fm=flexmock(Facebooker::User) 
    fm.new_instances.should_receive(:hometown_location).and_return(location) 
    mike=users(:mike) 
    assert_equal "an undisclosed location",mike.hometown 
  end
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
