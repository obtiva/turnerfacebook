require 'test_helper'

class AttacksControllerTest < ActionController::TestCase
  def test_new_requires_auth
    facebook_get :new, :fb_sig_user=>nil
    assert_facebook_redirect_to Facebooker::Session.create.login_url
  end
  
  def test_index_redirects_to_new_with_no_battles
    facebook_get :index
    assert_facebook_redirect_to new_attack_path
  end
  
  def test_can_view_own_battles
    #make sure the user has a battle
    User.for(1234).attack(users(:mike),moves(:chop))
    facebook_get :index
    assert_response :success
    assert_template "index"
  end
  
  def test_can_view_others_battles
    facebook_get :index, :user_id=>users(:mike).id
    assert_equal assigns(:user),users(:mike)
    assert_response :success
    assert_template "index"
  end
  
  def test_can_attack_single_user
    facebook_post :create, :attack=>{:move_id=>moves(:chop).id},:ids=>["5678"]
    assert_facebook_redirect_to new_attack_path
    assert_equal 1, User.for(1234).attacks.count
  end
  
  def test_can_attack_multiple_users
    facebook_post :create, :attack=>{:move_id=>moves(:chop).id},:ids=>["5678","9101112"]
    assert_facebook_redirect_to new_attack_path
    assert_equal 2, User.for(1234).attacks.count
  end
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
