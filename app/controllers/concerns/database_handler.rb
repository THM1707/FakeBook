module DatabaseHandler
  def self.facebook
    @facebook ||= Koala::Facebook::API.new('1878795835765300|D3JGeaNQnaq3-Slm4WP0vvGYPkk')
  end

  def self.get_post
    Post.destroy_all
    Page.all.each do |page|
      posts = facebook.get_object(page_link(page.permalink_url))
      posts.each do |p|
        fb_id = p['id']
        permalink_url = p['permalink_url']
        like_no = p['likes']['summary']['total_count']
        comment_no = p['comments']['summary']['total_count']
        message = p['message']
        page_id = page.id
        post = Post.create(fb_id: fb_id,
                           permalink_url: permalink_url,
                           likes: like_no,
                           comments: comment_no,
                           message: message,
                           page_id: page_id)
        update_category(post) if post.valid?
      end
    end
  end

  def self.page_link(link)
    param = 'posts?fields=permalink_url,shares,likes.summary(true),comments.summary(true),message&limit=5'
    begin_time = 1.month.ago.to_time.strftime('%s')
    end_time = Time.now.strftime('%s')
    link.concat("/#{param}&since=#{begin_time}&until=#{end_time}")
  end

  def self.update_category(post)
    Category.all.each do |category|
      category.keywords.split(',').each do |word|
        if !post.message.nil? && post.message.include?(word)
          category.posts << post
          break
        end
      end
    end
  end
end