json.extract! @review, :id, :shop_id, :user_id, :body, :title
json.username @review.user.fname
