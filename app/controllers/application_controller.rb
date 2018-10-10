require_relative '../../config/environment'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do #index
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do #start creating
    erb :new
  end

  post '/recipes' do #finish creating
    @recipe=Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end


get '/recipes/:id' do #find_by
  @recipe=Recipe.find_by_id(params[:id])
  erb :show
end


get '/recipes/:id/edit' do #start edit/delete
  @recipe=Recipe.find_by_id(params[:id])
  erb :edit
end

patch '/recipes/:id' do #finish
    @recipe=Recipe.find_by_id(params[:id])
    @recipe.name=params[:name]
    @recipe.ingredients=params[:ingredients]
    @recipe.cook_time=params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
end

delete '/recipes/:id/delete' do #delete
  @rec=Recipe.all.find_by_id(params[:id])
  @rec.delete
  redirect "/recipes"
end


end
