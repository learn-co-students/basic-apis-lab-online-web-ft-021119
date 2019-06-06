class RepositoriesController < ApplicationController

  def search

  end

		  def github_search

				client_id = 'Iv1.bf285af96e5f4b3d'	
				client_secret = 'adf3dd4d4d1c84efe02bffd12017b6b4ed4fd750'
				url = 'https://api.github.com/search/repositories'
		  resp = Faraday.get(url) do |req|
          req.params = {q: "#{params[:query]}"}
    		 end
    		 res = JSON.parse(resp.body)
   		@results = res["items"]

 		render :search
		  end
end
