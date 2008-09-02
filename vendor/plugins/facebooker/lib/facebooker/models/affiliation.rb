#---
# Excerpted from "Developing Facebook Platform Applications with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/mmfacer for more book information.
#---
require 'facebooker/model'
module Facebooker
  ##
  # Represents a user's affiliation, for example, which educational institutions
  # the user is associated with.
  class Affiliation
    include Model
    attr_accessor :name, :status, :type, :year, :nid
  end
end