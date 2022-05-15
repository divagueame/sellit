class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(name: :asc)
  end

  def new
    @category = Category.new
  end

  def edit
    category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url, notice: t('.notice')
    else
      render :new, status: :unprocessable_entity 
    end 
  end

  def update
    category
    if category.save
      redirect_to categories_url, notice: t('.notice')
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    category
    category.destroy
    redirect_to categories_url, notice: t('.notice')
  end

  private
    def category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
