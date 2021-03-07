class SubCategory1 < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '調味料'},
    { id: 2, name: '清酒' },
    { id: 3, name: '合成清酒'},
    { id: 4, name: '甲類焼酎'},
    { id: 5, name: '芋焼酎'},
    { id: 6, name: '麦焼酎'},
    { id: 7, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :items
  end