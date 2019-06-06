class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.06a253d0e82ccd31' 
      req.params['client_secret'] = '86dde82fd5cc81048f3a64c39615b9b3187fb6e4' 
      req.params['q'] = params[:query] 
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end
  render 'search'
  end
end
