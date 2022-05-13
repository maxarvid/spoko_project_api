
Article.destroy_all

Article.create! ([{


  title: "Deep Work",
  body: "Deep work is the ability to focus without distration on a cognitively demanding task" 
  author: "Carl Newport" 
  image: File.open(Rails.root.join('db/seed_images/deep_work.png'))
  category: "Business"

}])

p "created #{Article.count} articles"
