# frozen_string_literal: true

ActiveAdmin.register AdminAccount do
  permit_params :email, :password, :password_confirmation, :username

  index do
    selectable_column
    id_column
    column :email
    column :username
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :username
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :email
  filter :username
  # filter :current_sign_in_at
  # filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
