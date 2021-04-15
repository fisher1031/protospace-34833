class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
  if @prototype.save
    redirect_to root_path
  else
    render :new
  end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)
end

def edit
  @prototype = Prototype.find(params[:id])
  unless @prototype.user_id == current_user.id
    redirect_to action: :index
  end
end

def update
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
    redirect_to prototype_path
  else
    render :edit
  end
end

def destroy
  prototype = Prototype.find(params[:id])
  if prototype.destroy
    redirect_to root_path
  else @prototype.user_id == current_user.id
    redirect_to action: :index
  end
end

# 任意の文字列の最後の2文字を3回繰り返し、出力するメソッド。
def extra_end(str)
  char_num = str.length
  # slice(3,2)は配列番号（インデックス）3つ目から数えて2つ分の要素
  right2 = str.slice(char_num - 2, 2)
  puts right2 * 3
end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end