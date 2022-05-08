FactoryBot.define do
  factory :article do
    title { "News about Spoko" }
    body { "We are the champions of the World" }
    author { "MyString" }
    image {}
    category
  end
end
