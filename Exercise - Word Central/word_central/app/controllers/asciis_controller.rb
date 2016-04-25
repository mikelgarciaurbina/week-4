class AsciisController < ApplicationController
	def new
	end

	def create
		text = params[:text_ascii][:user_text]
		
		a = Artii::Base.new :font => 'slant'
		@text_ascii = a.asciify(text)
		render "results"
	end
end
