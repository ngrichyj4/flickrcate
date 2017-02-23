class PhotosController < ApplicationController
	def index
	end

	def search
		response = flickr.photos.search text: params[:keyword].presence || 'cod', 
			page: params[:page] || 1, per_page: 6
		@photos  = response.map{|photo| FlickRaw.url photo}
		respond_to do |format|
			format.html { render 'photos', layout: false }
		end
	end
end
