ActiveAdmin.register Category do

  permit_params :name,:is_displayed

  form do |f|
    f.inputs          # 入力フィールドを表示
    f.actions         # submit/cancelボタンを表示
  end
end
