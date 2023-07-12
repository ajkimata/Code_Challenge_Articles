# Please copy/paste all three classes into this file to submit your solution!
class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def articles
      Article.all.select { |article| article.author == self }
    end
  
    def magazines
      articles.map { |article| article.magazine }.uniq
    end
  
    def add_article(magazine, title)
      Article.new(self, magazine, title)
    end
  
    def topic_areas
      magazines.map { |magazine| magazine.category }.uniq
    end
  end
  
  class Magazine
    attr_accessor :name, :category
  
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_name(name)
      @@all.find { |magazine| magazine.name == name }
    end
  
    def article_titles
      Article.all.select { |article| article.magazine == self }.map { |article| article.title }
    end
  
    def contributing_authors
      Article.all.select { |article| article.magazine == self }
                  .group_by { |article| article.author }
                  .select { |_author, articles| articles.length > 2 }
                  .keys
    end
  end
  
  class Article
    attr_reader :author, :magazine, :title
  
    @@all = []
  
    def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    end
  
    def self.all
      @@all
    end
  end
  