class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @recipes = Recipe.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @recipe = Recipe.find( params[:id] )
  end

  # GET /movies/new
  def new
    @recipe = Recipe.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    user = @current_user
    recipe = Recipe.new(recipe_params)
    recipe.user = user

    respond_to do |format|
      if recipe.save

        # format.html { redirect_to @recipe.user, notice: 'recipe was successfully created.' }
        format.html { redirect_to user_path(User.find_by_id(session[:user_id])), notice: 'recipe was successfully created.' }
        #format.json { render :show, status: :created, location: @recipe.user }
      else
        format.html { render :new }
        format.json { render json: recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update

# @recipe = Recipe.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :image, :instructions)
    end
end
