class LandingController < ApplicationController
  def index
    @starred_repositories = starred_repositories
    render "show" and return if @starred_repositories.any?
  end

  private

  def starred_repositories
    return [] unless params[:login]

    @username = params[:login]
    res = HTTParty.get("https://api.github.com/users/#{@username}/starred")

    starred_repos = []

    if res.code == 200
      if res.any?
         res.each do |repo|
          starred_repos << Repository.build!(repo)
        end
      end
    end

    starred_repos
  end
end
