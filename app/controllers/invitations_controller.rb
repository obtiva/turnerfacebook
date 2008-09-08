#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
class InvitationsController < ApplicationController
  def new
  	if should_update_profile?
  	  update_profile
  	end
  	@from_user_id = facebook_session.user.to_s
  	friends_ids = params[:fb_sig_friends].split(/,/)
  	@not_potential_disciples = current_user.friends_with_senseis(friends_ids).map(&:facebook_id)
  end
  
  def index
    redirect_to battles_path
  end
  
  def should_update_profile?
    params[:from]
  end
  
  def update_profile
  	@user = facebook_session.user
  	@user.profile_fbml = render_to_string(:partial=>"profile", :locals=>{:from=>params[:from]})	  
  end
  
  
  def create
    @sent_to_ids = params[:ids]
  end
  
  
end
