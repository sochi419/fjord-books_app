# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to book_path(params[:book_id]), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
