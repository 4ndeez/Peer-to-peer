class HomeController < ApplicationController
  def index
    @items = Item.all.order(updated_at: :desc)
  end
end
