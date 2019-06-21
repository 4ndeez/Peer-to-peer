class HomeController < ApplicationController
  def index
    @items = Item.all.order(updated_at: :desc).page(params[:page]).per(10)
    @search = params["search"]
    if @search.present?
      @items = Item.where('title LIKE ?', "%#{@search}").order(updated_at: :desc).page(params[:page]).per(10)
    end
    @sort = params[:sort]
    if @sort.present?
      var = @sort[0].to_i
      case var
      when 1
        @items= Item.all.order(updated_at: :asc).page(params[:page]).per(10)
      when 2
        @items= Item.all.order(updated_at: :desc).page(params[:page]).per(10)
      when 3
        @items= Item.all.order(price: :asc).page(params[:page]).per(10)
      when 4
        @items= Item.all.order(price: :desc).page(params[:page]).per(10)
      else
        @items= Item.all.order(updated_at: :desc).page(params[:page]).per(10)
      end
    end
  end

  def search
    @items = Item.search(search_params).order(updated_at: :desc).page(params[:page]).per(10)
    render 'home/index'
  end

  def set_locale
    I18n.default_locale = params[:locale]
    redirect_back(fallback_location: root_path)
  end

  private

  def item_params
    params.require(:search).permit(:name)
  end

  def item_sort_params
    params.require(:sort).permit(:updated_at, :price)
  end

  def search_params
    params.permit(:city_id, :category, :price_from, :price_to, :condition, :image_file_size)
  end
end
