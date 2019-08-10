FactoryBot.define do
  factory :question do
    content { 'テスト質問' }
    impressions { 0 }
    category { nil }
  end
end
