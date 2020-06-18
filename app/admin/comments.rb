# frozen_string_literal: true

ActiveAdmin.register Comment, :as => "PostComment" do
  permit_params :post_comment

  filter :id
  filter :user
  filter :post_comment
  filter :created_at
end
