class RepositoriesController < ApplicationController

  def search

  end

  def github_search 
    
  begin
      @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
          req.params['client_id'] = '5fbb588cd9405fb6eec2'
          req.params['client_secret'] = '2843a743ad0fff43d96d1028fd6922d270d4b982'
          req.params['q'] = 'tetris'
      end
      binding.pry
      body = JSON.parse(@resp.body)
        if @resp.success?
          @repo = body["items"][0]
        else
          @error = body["meta"]["errorDetail"]
        end
  
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  end
  
end
