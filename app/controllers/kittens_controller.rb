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
    @kitten = Kitten.new(kitten_params)
    
    if @kitten.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kittens = Kitten.find(params[:id])
  end

  def update
    @kittens = Kitten.find(params[:id])

    if @kittens.update(kitten_params)
      redirect_to edit_kitten_path(@kittens)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def kitten_params
    params.expect(kitten: [:name, :age, :cuteness, :softness])
  end
end
