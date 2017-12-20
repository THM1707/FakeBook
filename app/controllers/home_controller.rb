class HomeController < ActionController::Base
  def index
    render file: 'frontend/dist/index.html'
  end
end
