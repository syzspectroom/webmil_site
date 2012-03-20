class PagesController < ApplicationController
  def home
  	@title = 'Home'
  end

  def works
  	@title = 'Works'
  end

  def team
  	@title = 'Team'
  end

  def contacts
  	@title = 'Contacts'
  end
end
