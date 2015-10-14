class LandingController < ApplicationController
  def index
    @starred_repositories = starred_repositories
    render "show" and return if @starred_repositories.any?
  end

  private

  def starred_repositories
    repos = if params[:login]
              @username = params[:login]
              HTTParty.get("https://api.github.com/users/#{@username}/starred")
            else
              []
            end

    starred_repos = []

    if repos.any?
      repos.each do |repo|
        starred_repos << Repository.build!(repo)
      end
    end

    starred_repos
  end
end
