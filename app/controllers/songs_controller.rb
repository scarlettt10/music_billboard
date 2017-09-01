class SongsController < ApplicationController
    
    
        before_action :set_artist, only: [:show, :edit, :update, :destroy]
        
        
        def index
          @songs = Song.all
        end
      
        def show
          
        end
      
        def new
          @song = @song.artist.new
          render partial: "form"
        end
      
        def edit
          render partial: "form"
        end
      
        def create
          @song = @song.artist.new(song_params)
          
          if @song.save
            redirect_to [@song, @artist]
          else 
            render partial: "form"
          end
        end
      
        def update
          if @song.update(song)
            redirect_to [@song, @artist]
          else
            render partial: "form"
          end
        end
      
        def destroy
          @song.destroy
          redirect_to billboard_artists_song_path(@song)
        end
      
      private
      
        
      
        def set_artist
          @artist = Artist.find(params[:id])
        end
      
        def song_params
          params.require(:song).permit(:title)
        end
      
      end
      