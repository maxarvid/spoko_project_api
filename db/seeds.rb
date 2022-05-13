require 'faker'

Article.destroy_all
Category.destroy_all
Product.destroy_all

Category.create({ name: 'Football' })
Category.create({ name: 'Tennis' })
Article.create!(
  {
    title: 'Deep Football',
    body: 'Deep Football is the ability to focus without distration on the cognitively demanding task of playing football',
    author: 'Carl Newport',
    category: Category.find_by(name: 'Football')
    #  image: ( File.open(Rails.root.join('/db/seed_images/deep_work.png')),
    #    filename: 'attachment',
    #    content_type: 'image/png')
  }
)

Article.create!(
  {
    title: 'The Lean Football Manager',
    body: 'The lean football manager  is a new appraoch to business thats being adopted around the world. ',
    author: 'Eric Ries',
    category: Category.find_by(name: 'Football')
  }
)

Article.create!(
  {
    title: 'Open',
    body: 'Far more than a superb memoir about the highest levels of professional tennis, Open is the engrossing story of a remarkable life.',
    author: 'Andre Agassi',
    category: Category.find_by(name: 'Tennis')
  }
)
p "Created #{Article.count} articles"

50.times do |_index|
  size_choice = %w[extra_small small medium large extra-large]
  Product.create!(name: Faker::Commerce.product_name,
                  size: size_choice[rand(size_choice.length)],
                  price: Faker::Commerce.price(range: 0..1000.0, as_string: true))
end
p "Created #{Product.count} products"
