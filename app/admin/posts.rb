ActiveAdmin.register Post do

  permit_params :title, :objective, :body, :review, :image, :category

  index do
    column :id
    column :user
    column :title
    column :objective
    column :body
    column :review
    column :image
    column :category
    column :created_at
    column :updated_at
  end
end
