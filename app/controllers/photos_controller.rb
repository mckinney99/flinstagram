class PhotosController < ApplicationController
    get '/photos' do
      if logged_in?
        @photos = Photo.all
        erb :'/photos/photos'
      else
        redirect to '/login'
      end
    end
  
    get '/photos/new' do
      if logged_in?
        erb :'/photos/create_photo'
      else
        redirect to '/login'
      end
  
    end
  
    post '/photos' do
      if params[:content] == ""
        redirect '/photos/new'
      else
        @photo = current_user.photos.create(content: params[:content])
        redirect to "/photos/#{@photo.id}"
    end
  end
  
  
    get '/photos/:id' do
      if logged_in?
        @photo = photo.find_by_id(params[:id])
        erb :'/photos/show_photo'
      else
        redirect to '/login'
      end
    end
  
    get '/photos/:id/edit' do
      if logged_in?
        @photo = photo.find_by_id(params[:id])
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
      if params[:content] == ""
        redirect to "/photos/#{params[:id]}/edit"
      else
        @photo = photo.find_by_id(params[:id])
        @photo.content = params[:content]
        @photo.save
        redirect to "/photos/#{@photo.id}"
      end
    end
  
    delete '/photos/:id/delete' do
      if logged_in?
        @photo = photo.find_by_id(params[:id])
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