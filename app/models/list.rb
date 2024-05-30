class List < ApplicationRecord
  # Listモデルにtitleとbodyに加えて
  # 画像を扱うためのimageカラムを追記
  has_one_attached :image
end
