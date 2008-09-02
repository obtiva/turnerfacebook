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
  	if params[:from]
  		@user = facebook_session.user
  		@user.profile_fbml = 
  		render_to_string(:partial=>"profile",
  		  :locals=>{:from=>params[:from]})	  
  	end
  	@from_user_id = facebook_session.user.to_s
  end
  
  
  def create
    @sent_to_ids = params[:ids]
  end
  
  
end
