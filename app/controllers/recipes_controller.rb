class RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        user = User.find_by(id: session[:user_id])
        if user
            render json: recipes, status: :created
        else
            render json: {error: "could not find recipe"}, status: :unauthorized
        end
    end

    def create
        recipe = Recipe.create(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
