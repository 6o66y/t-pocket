# frozen_string_literal: true

ActiveAdmin.register Comment, :as => "PostComment" do
  permit_params :post_comment
end
