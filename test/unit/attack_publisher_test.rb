require File.dirname(__FILE__) + '/../test_helper' 

class AttackPublisherTest < ActiveSupport::TestCase 
  fixtures :users, :belts, :attacks 
  def test_attack_notification
    a=attacks(:one)
    recipient=a.defender
    fm=flexmock(AttackPublisher)
    fm.new_instances.should_receive(:recipients).with(recipient.facebook_session.user)
    story = AttackPublisher.create_attack_notification(attacks(:one)) 
    assert_equal "<fb:fbml> ...", notification.fbml 
  end
end