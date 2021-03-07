class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '調味料' },
    { id: 2, name: '清酒' },
    { id: 3, name: '合成清酒' },
    { id: 4, name: '焼酎' },
    { id: 5, name: 'チューハイ' },
    { id: 6, name: '梅酒' },
    { id: 7, name: 'ウイスキー' },
    { id: 8, name: 'ブランデー' },
    { id: 9, name: 'リキュール' },
    { id: 10, name: '製菓用リキュール' },
    { id: 11, name: 'ラム・スピリッツ' },
    { id: 12, name: 'ノンアルコール' },
    { id: 13, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :user
end
