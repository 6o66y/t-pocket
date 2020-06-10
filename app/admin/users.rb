ActiveAdmin.register User do

  permit_params :name, :is_deleted, :email

  index do
    column :id
    column :name
    column :username
    column :introduction
    column :email
    column :is_deleted
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :is_deleted
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :username
      row :introduction
      row :email
      row :is_deleted
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
