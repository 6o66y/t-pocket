ActiveAdmin.register User do

  permit_params :name, :username, :introduction, :email, :is_deleted

  index do
    selectable_column
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

  form do |f|
    f.inputs do
      f.input :name
      f.input :username
      f.input :email
      f.input :introduction
      f.input :is_deleted
    end
    f.actions
  end
end
