class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kittens = Kitten.find(params[:id])
  end

  def new
    @kittens = Kitten.new
  end

  def create
    @kittens = Kitten.new(kitten_params)
    
    if @kittens.save
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
      redirect_to root_path, notice: "Kitten updated successfully 😺"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kittens = Kitten.find(params[:id])
    @kittens.destroy
    
    redirect_to root_path, notice: "Kitten says goodbye 🥹"
  end

  private
  def kitten_params
    params.expect(kitten: [:name, :age, :cuteness, :softness])
  end
end
