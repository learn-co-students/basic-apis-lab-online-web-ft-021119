class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    url = 'https://api.github.com/search/repositories'

    @resp = Faraday.get(url) do |req|
      req.params = {q: "#{params[:query]}"}
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
