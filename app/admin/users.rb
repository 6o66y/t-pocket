ActiveAdmin.register User do

  permit_params :name, :username, :introduction, :profile_image, :is_deleted

  # index do
  #   column :id
  #   column :name
  #   column :username
  #   column :profile_image
  #   column :introduction
  #   column :is_deleted
  #   column :created_at
  #   column :updated_at
  # end
end
