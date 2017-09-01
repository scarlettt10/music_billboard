class ArtistsController < ApplicationController

    
    before_action :set_artist, only: [:show, :edit, :update, :destroy]
    
    
    def index
      @artists = Artist.all
    end
  
    def show
      
    end
  
    def new
      @artist = @billboard.artist.new
      render partial: "form"
    end
  
    def edit
      render partial: "form"
    end
  
    def create
      @artist = @billboard.artist.new(artist_params)
      
      if @artist.save
        redirect_to [@billboard, @artist]
      else 
        render partial: "form"
      end
    end
  
    def update
      if @artist.update(artist)
        redirect_to [@billboard, @artist]
      else
        render partial: "form"
      end
    end
  
    def destroy
      @artist.destroy
      redirect_to billboard_artists_path(@billboard)
    end
  
  private
  
   
  
    def set_artist
      @billboard = Artist.find(params[:id])
    end
  
    def artist_params
      params.require(:artist).permit(:name, :title)
    end
  
  end
  