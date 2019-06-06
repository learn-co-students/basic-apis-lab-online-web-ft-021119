class RepositoriesController < ApplicationController

  def search

  end

		  def github_search

				client_id = ''	
				client_secret = ''
				url = 'https://api.github.com/search/repositories'
		  resp = Faraday.get(url) do |req|
          req.params = {q: "#{params[:query]}"}
    		 end
    		 res = JSON.parse(resp.body)
   		@results = res["items"]

 		render :search
		  end
end
