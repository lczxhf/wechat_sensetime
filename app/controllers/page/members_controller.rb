class Page::MembersController < Page::ApplicationController
	def new
	    @member = Member.new
	end
end
