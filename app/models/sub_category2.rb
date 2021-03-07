class SubCategory2 < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'チューハイ'},
    { id: 2, name: '梅酒' },
    { id: 3, name: 'ウイスキー'},
    { id: 4, name: 'ブランデー'},
    { id: 5, name: 'リキュール'},
    { id: 6, name: '製菓用リキュール'},
    { id: 7, name: 'ラム・スピリッツ'},
    { id: 8, name: 'ノンアルコール'},
    { id: 9, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :items
  end