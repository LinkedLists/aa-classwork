class CatsController < ApplicationController
  def index
    @cats = Cat.all

    render :index
  end

  def show

    @kitty = find_cat
    if @kitty
      render :show
    else
      redirect_to display_cat_url
    end
  end

  def new
    @kitty = Cat.new
    @kitty.sex == "F" ? @isFemale = true : @isFemale = false

    render :new
  end

  def create
    @kitty = new_cat

    if @kitty.valid?
      @kitty.save
      redirect_to show_cat_url(@kitty.id)
    else
      render :new
    end
  end

  def edit
    @kitty = find_cat
    if @kitty
      render :edit
    else
      redirect_to display_cat_url
    end
  end

  def update
    @kitty = find_cat
    @kitty.update(cat_params)
    if @kitty.valid?
      @kitty.save
      
      render :show
    else
      redirect_to edit_cat_url
    end
    
  end

  def cat_params

    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description) 
  end

  def find_cat
    Cat.find_by(id: params[:id])
  end

  def new_cat
    Cat.new(cat_params)
  end
end
