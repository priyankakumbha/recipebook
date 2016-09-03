require 'google/api_client'
# require 'trollop'

class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  DEVELOPER_KEY =  'AIzaSyDwouYJaSWiuSaJk7u4wjyaBDQGogC_ItU'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def get_youtube_service
    client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
    )
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    return client, youtube
  end

  def get_youtube_videos(recipe_name)


    client, youtube = get_youtube_service

    begin
      # Call the search.list method to retrieve results matching the specified
      # query term.
      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => recipe_name,
          :maxResults => 3,
          :channelId=>'UCpSgg_ECBj25s9moCDfSTsA'
          #:channelId=>'UC-eez0IJKrZSFzPBXuQ8arg'

        }
      )

      all_videos = []

      # Add each result to the appropriate list, and then display the lists of
      # matching videos, channels, and playlists.
      search_response.data.items.each do |search_result|
        case search_result.id.kind
          when 'youtube#video'
            # videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
            thumbnail_url= "#{search_result.snippet.thumbnails.high.url} "
            video_id =  "#{search_result.id.videoId}"
            puts video_id
            videoURL ="https://www.youtube.com/watch?v=#{video_id}"
            # puts videoURL
            hrefTagStart="<a href='#{videoURL}'>"
            hrefTagEnd="</a>"
            paraValue= "<img src= '#{thumbnail_url}'style='width:250px;height:250px; margin-right:10px;'>";
            # /* display output in result area */
            youtubeurl=  "#{hrefTagStart}#{paraValue}#{hrefTagEnd}"

            all_videos << youtubeurl.html_safe
        end
      end

      # puts "Videos:\n", videos, "\n"
      # puts "Channels:\n", channels, "\n"
      # puts "Playlists:\n", playlists, "\n"
    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
    return all_videos
  end


  def index
    @recipes = Recipe.all
  end
#   def self.search params
#   recipes = recipe.where(category_id: params[:category].to_i) unless params[:category].blank?
#   recipes
# end
  def search
    @recipes = Category.find( params[:category] ).recipes.where(:user_id => @current_user.id)
end

  def show
    @recipe = Recipe.find( params[:id] )
    @all_video_link = get_youtube_videos("recipe of #{@recipe.name}") if @recipe.name

  end


  def new
    @recipe = Recipe.new
  end


  def edit
  end


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


  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@current_user), notice: 'Recipe was successfully destroyed.' }
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
      params.require(:recipe).permit(:name, :image, :instructions, :category_ids, { :ingredient_ids => [] })
    end
end
