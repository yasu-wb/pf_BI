class SubCategory < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '調味料' },
    { id: 2, name: '清酒' },
    { id: 3, name: '合成清酒' },
    { id: 4, name: '甲類焼酎' },
    { id: 5, name: '麦焼酎' },
    { id: 6, name: '芋焼酎' },
    { id: 7, name: 'その他焼酎' },
    { id: 8, name: 'チューハイ' },
    { id: 9, name: '梅酒' },
    { id: 10, name: '果実酒'},
    { id: 11, name: 'ウイスキー' },
    { id: 12, name: 'ブランデー' },
    { id: 13, name: 'リキュール' },
    { id: 14, name: '製菓用リキュール' },
    { id: 15, name: 'ラム・スピリッツ' },
    { id: 16, name: 'ノンアルコール' },
    { id: 17, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :user
end
