ActiveAdmin.register User do

  permit_params :name, :username, :introduction, :profile_image, :is_deleted

  index do
    column :id
    column :name
    column :username
    column :profile_image
    column :introduction
    column :is_deleted
    column :created_at
    column :updated_at
end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :name, :, :profile_image_id, :introduction, :is_deleted
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :username, :profile_image_id, :introduction, :is_deleted]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
