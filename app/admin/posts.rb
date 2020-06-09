ActiveAdmin.register Post do

  permit_params :title, :objective, :body, :review, :image, :is_displayed

  index do
    column :id
    column :user
    column :title
    column :objective
    column :body
    column :review
    column :image
    column :is_displayed
    column :created_at
    column :updated_at
  end
end
