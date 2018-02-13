require"pry"

class PhotosController < ApplicationController
    get '/photos' do
    logged_in?
    @photos = Photo.all
    erb :'/photos/photos'
    end
    
  
    get '/photos/new' do
      if logged_in?
        erb :'/photos/create_photo'
      else
        redirect to '/signup'
      end
    end
  
    post '/photos' do
      if @photo = params[:title] && params[:caption] && params[:image_url] == ""
        redirect '/photos/new'
      else
        @photo = current_user.photos.create(title: params[:title], caption: params[:caption], image_url: params[:image_url])
        redirect to "/photos/#{@photo.id}"
      end
    end

    post '/photos/:id' do
      if logged_in?
        @photo = Photo.find_by_id(params[:id])
        @comment = current_user.comments.create(comment_text: params[:comment_text])
        @comment.user_id = current_user.id
        @comment.photo_id = @photo.id
        @comment.save
        redirect to "/photos/#{@photo.id}"
      else
        redirect to "/signup"
      end   
    end
  
  
    get '/photos/:id' do
     
        @photo = Photo.find_by_id(params[:id])
        @comment = Comment.find_by_id(params[:id])
        erb :'/photos/show_photo'
      
      
    end
  
    get '/photos/:id/edit' do
      if logged_in?
        @photo = Photo.find_by_id(params[:id])
        if current_user.id == @photo.user_id
          erb :'/photos/edit_photo'
        else
          redirect to '/photos'
        end
      else
        redirect to '/login'
      end
    end
  
    patch '/photos/:id' do
    puts params
      if @photo = params[:title] && params[:caption] && params[:image_url] == ""
        redirect to "/photos/#{params[:id]}/edit"
      else
        @photo = Photo.find_by_id(params[:id])
        @photo.title = params[:title]
        @photo.caption = params[:caption]
        @photo.image_url = params[:image_url]
        @photo.save
        redirect to "/photos/#{@photo.id}"
      end
    end
  
    delete '/photos/:id/delete' do
      if logged_in?
        @photo = Photo.find_by_id(params[:id])
        if @photo.user_id == current_user.id
          @photo.delete
          redirect to '/photos'
        else
          redirect to '/photos'
        end
      else
        redirect to '/login'
      end
    end
  end