class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.where(id: params[:dose][:ingredient_id])

    @doses = []

    @ingredients.each do |ingredient|
      @dose = Dose.new(description: params[:dose][:description])
      @dose.ingredient = ingredient
      @dose.cocktail = @cocktail

      @doses << @dose
    end

    if @doses.all?(&:save)
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
