class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @coktail = Cocktail.new
    # you need to give an empty shell to your form_for!
  end

  def create
    @coktail = Cocktail.new(coktail_params)
    @coktail.save

    # no need for app/views/coktails/create.html.erb
    redirect_to coktail_path(@coktail)
  end

  private

  def coktail_params
    params.require(:coktail).permit(:name)
  end
end
