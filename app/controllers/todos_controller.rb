class TodosController < ApplicationController
  before_action :authenticate_user!, :get_user_id
  before_action :get_todo_item_by_user_id, only: [:show, :update]

  @user_id
  @todo_item

  def index
    todo_list = TodoItem.where(user_id: current_user.id)
    render json: todo_list, status: :ok
  end

  def create
    todo_item = TodoItem.create!(title: todo_info[:title], content: todo_info[:content], user_id: @user_id)
    if todo_item
      render json: todo_item, status: :created
    else
      render json: {status: :expectation_failed, message: todo_item.errors.full_messages[0]}
    end
  end

  def show
    if @todo_item
      render json: @todo_item, status: :ok
    end
  end

  def update
    if @todo_item
      updaet_todo_item = @todo_item.update!(title: todo_info[:title], content: todo_info[:content])
      if updaet_todo_item
        render json: updaet_todo_item, status: :ok
      else
        render json: {status: :expectation_failed, message: updaet_todo_item.errors.full_messages[0]}
      end
    end
  end

  def destroy
    TodoItem.destroy_by(user_id: @user_id, id: params[:id])
    render json: "Delete Todo Item Successful", status: :ok 
  end

  private

  def todo_info
    params.require(:todo).permit(:title, :content)
  end

  def get_user_id
    @user_id = current_user.id
  end

  def get_todo_item_by_user_id
    @todo_item = TodoItem.where(user_id: @user_id, id: params[:id])
  end
  
end
