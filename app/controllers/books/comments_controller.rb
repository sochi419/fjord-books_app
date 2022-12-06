# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy]

  def create
    super
    redirect_to book_path(params[:book_id]), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def destroy
    super
    redirect_to book_path(params[:book_id]), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
