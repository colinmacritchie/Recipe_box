class RecipesController < ApplicationController
before_action :find_recipe, only: [:show, :edit, :update, :destroy]

#displays all recipes on index page.
def index
  @recipe = Recipe.all.order("created_at DESC")
end

#Shows the show.html.haml view file for the recipes.
def show

end

#Method for creating a new recipe.
def new
  @recipe = Recipe.new
end

  #Method for creating and saving a new recipe to the DB.
def create
  @recipe = Recipe.new(recipe_params)

    if @recipe.save
     redirect_to @recipe, notice: "Succesfully created new recipe"
    else
     render 'new'
  end

end

#Method for editing a current recipe.
def edit

end

  #Method for updating a new recipe.
def update

  if @recipe.update(recipe_params)
    redirect_to @recipe

  else

    render 'edit'
  end

end

#Method for deleting a recipe & returning user to root#index.
def destroy

  @recipe.destroy
  redirect_to root_path, notice: "Succesfully deleted recipe"
end


private

  #Sets up recipe params and permits the title and description fields.
  def recipe_params

    params.require(:recipe).permit(:title, :description)

  end

  #Private method for finding the recipe by the :id Param
    def find_recipe
     @recipe = Recipe.find(params[:id])
    end

  end
