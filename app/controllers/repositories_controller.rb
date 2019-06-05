class RepositoriesController < ApplicationController


  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.d02a028c99512056'
      req.params['client_secret'] = '576d8c16ce7e1d679abe7e6412a686bb2d5cea6e'
      req.params['q'] = 'tetris'
      req.params['sort'] = 'stars'
      req.params['order'] = 'desc'
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]


    render 'search'
  end

end
