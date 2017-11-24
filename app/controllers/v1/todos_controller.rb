module V1
  class TodosController < ApplicationController
    before_action :set_todo, only: %i(show update destroy)

    def index
      json_response(current_user.todos.paginate(page: params[:page], per_page: per_page))
    end

    def show
      json_response(@todo)
    end

    def create
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end

    def update
      @todo.update(todo_params)
      head :no_content
    end

    def destroy
      @todo.destroy
      head :no_content
    end

    #
    # PRIVATE
    #

    private

    def todo_params
      params.permit(:title)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
  end
end
