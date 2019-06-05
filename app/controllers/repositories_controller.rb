class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
        # req.params['client_id'] ='Iv1.2f41a420e879c989'
        # req.params['client_secret'] = '923dfca62f9757c917b129bbfd77dc65280d573b'
        req.params['q'] = params[:query]
      end

      body_hash = JSON.parse(@response.body)
      @repositories = body_hash['items']
    end
    render 'search'
  end
end

  #   body_hash = JSON.parse(@resp.body)
  #   if @resp.success?
  #     @venues = body_hash["response"]["venues"]
  #   else
  #     @error = body_hash["meta"]["errorDetail"]
  #   end
  #   rescue Faraday::ConnectionFailed
  #     @error = "There was a timeout. Please try again."
  #   end
  #   render 'search'
  # end
