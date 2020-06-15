# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :category_id

  index do
    selectable_column
    column :id
    column :user
    column :title
    column :category_id
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :title
      row :objective
      row :body
      row :review
      row :category_id
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
