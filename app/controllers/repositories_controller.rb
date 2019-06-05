class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'zoey7117'
      req.params['client_secret'] =  'c90c1cc891f91c94c1b039ff40323599020c20e1'
      req.params['q'] =  'tetris'

  end
  body_hash = JSON.parse(@resp.body)
 @items = body_hash["items"]
 render 'search'


  end

end
