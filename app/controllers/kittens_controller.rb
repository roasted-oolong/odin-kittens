class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens}
    end
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
      flash[:sucess] = "Success! Welcome, #{@kittens.name} 😺"
      redirect_to root_path
    else
      flash.now[:error] = "We couldn't create your kitten 🥲 - Please fix your form"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kittens = Kitten.find(params[:id])
  end

  def update
    @kittens = Kitten.find(params[:id])

    if @kittens.update(kitten_params)
      flash[:success] = "Kitten updated successfully 😺"
      redirect_to root_path
    else
      flash.now[:error] = "Kitten update failed 🥲 - Please fix your form"
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
