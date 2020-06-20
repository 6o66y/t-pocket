# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :name, :is_displayed

  filter :id
  filter :name
  filter :is_displayed
  filter :created_at
end
