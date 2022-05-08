class Article < ApplicationRecord
  belongs_to :category
  has_one_attached :image


  def attach_image(image_data)
    decoded_data = decode_base64_string(image_data)
    decoded_image_data = Base64.decode64(decoded_data[:data])
    io = StringIO.new
    io << decoded_image_data
    io.rewind
    image.attach(
      io:, filename: "#{title}.#{decoded_data[:extension]}",
      content_type: decoded_data[:type]
    )
  end

  private


  def decode_base64_string(image_data)
    image_data =~ /^data:(.*?);(.*?),(.*)$/
    object = {}
    object[:type] = Regexp.last_match(1)
    object[:encoder] = Regexp.last_match(2)
    object[:extension] = Regexp.last_match(1).split('/').last
    object[:data] = Regexp.last_match(3)
    object
  end
end
