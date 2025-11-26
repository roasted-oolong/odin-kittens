class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kittens = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
