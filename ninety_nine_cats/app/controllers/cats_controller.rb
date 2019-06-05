

class CatsController <  ApplicationController

  def index
    @cats = Cat.all

    render :index

  end

  def show
    @cat = Cat.find(params[:id])

    render :show
  end

  def new
    @cat = Cat.new

    render :new
  end

  def create
    @c = Cat.new(cat_params)
    if @c.save
      redirect_to cat_url(@c)
    else
      render json: Cat.errors.full_messages, status: 418
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.persisted?
      #yes,good
      @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 418
    end

  end


  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :description, :color) 
  end
end