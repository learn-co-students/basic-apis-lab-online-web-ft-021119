class RepositoriesController < ApplicationController

  def search

  end

  def github_search

  	client_id = "Iv1.df71c7b74116f0ce"
    secret = "0630386a917e52801ca93745ae9a9f74679a15fd"
  	 @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end
body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
