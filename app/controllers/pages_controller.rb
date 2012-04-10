class PagesController < ApplicationController
  def home
  	@title = 'Home'
    @works = Work.for_main_page
  end

  def team
  	@title = 'Team'
  end

  def contacts
  	@title = 'Contacts'
  end
end
