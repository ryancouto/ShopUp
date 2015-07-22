json.extract! @review, :id, :shop_id, :user_id, :body, :title, :created_at, :updated_at
json.username @review.user.fname
