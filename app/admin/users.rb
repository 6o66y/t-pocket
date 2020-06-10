ActiveAdmin.register User do

  permit_params :name, :username, :introduction, :profile_image, :is_deleted, :email

  index do
    column :id
    column :name
    column :username
    column :profile_image
    column :introduction
    column :email
    column :is_deleted
    column :created_at
    column :updated_at
    actions
  end
end
