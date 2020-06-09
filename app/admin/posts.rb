ActiveAdmin.register Post do

  permit_params :title, :objective, :body, :review, :image, :category_id

  index do
    column :id
    column :user
    column :title
    column :objective
    column :body
    column :review
    column :image
    column :category_id
    column :created_at
    column :updated_at
    actions
  end
end
