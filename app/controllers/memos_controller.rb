class MemosController < ApplicationController
  before_action :authorize,  only: [:show, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @all_memos = Memo.all
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
  end
  
  def create
    @memo = current_user.memos.create!(memo_params)
    if @memo
      current_user.notices.create(name: 'Information about your memo',
                                  message: "Memo \'#{@memo.title}\' was created.")
      redirect_to users_memos_path(id: @memo), success: 'New memo created successfully.'
    else
      redirect_to new_users_memos_path, danger: 'Failed to create new memo.'
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    memos_title = @memo.title
    if @memo.update_attributes(memo_params)
      current_user.notices.create(name: 'Information about your memo',
                                  message: "Memo \'#{memos_title}\' was edited.")      
      redirect_to users_memos_path(id: @memo), success: 'Changes saved successfully.'
    else
      redirect_to edit_users_memos_path(id: @memo), danger: 'Invalid changes exist.'
    end
  end

  def destroy
    memos_title = @memo.title
    @memo.destroy
    current_user.notices.create(name: 'Information about your memo',
                                  message: "Memo \'#{memos_title}\' was edited.")
    redirect_to users_url, success: 'The memo was successfully deleted.'
  end
  
  private
  def memo_params
    params.require(:memo).permit(:title, :body)
  end

  def correct_user
    @memo = current_user.memos.find_by(id: params[:id])
    if @memo.nil?
      redirect_to root_url, warning: 'Invalid request detected.'
    end
  end
end
