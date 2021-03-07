class MainCategory < ActiveHash::Base
self.data = [
  { id: 0, name: '--' },
  { id: 1, name: '和酒'},
  { id: 2, name: '洋酒' },
  { id: 3, name: '原料'}
]
include ActiveHash::Associations
  has_many :items
end