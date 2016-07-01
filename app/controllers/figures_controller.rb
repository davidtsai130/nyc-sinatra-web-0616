class FiguresController < ApplicationController

  get '/figures/new' do 
    erb :'figures/new'
  end

  get '/figures' do
    @allfigures = Figure.all 
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
    redirect "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:landmark][:name].any?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    erb :'figures/show'
  end

end
