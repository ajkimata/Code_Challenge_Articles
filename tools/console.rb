require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

# require_relative '../author'
require_relative '../solution'

RSpec.describe Author do
  describe "#initialize" do
    it "creates a new author with a name" do
      author = Author.new("John Doe")
      expect(author.name).to eq("John Doe")
    end
  end

  describe "#articles" do
    it "returns an array of articles written by the author" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Magazine A", "Category A")
      article1 = Article.new(author, magazine, "Article 1")
      article2 = Article.new(author, magazine, "Article 2")
      expect(author.articles).to eq([article1, article2])
    end
  end

  describe "#magazines" do
    it "returns a unique array of magazines the author has contributed to" do
      author = Author.new("John Doe")
      magazine1 = Magazine.new("Magazine A", "Category A")
      magazine2 = Magazine.new("Magazine B", "Category B")
      Article.new(author, magazine1, "Article 1")
      Article.new(author, magazine2, "Article 2")
      Article.new(author, magazine1, "Article 3")
      expect(author.magazines).to eq([magazine1, magazine2])
    end
  end

  describe "#add_article" do
    it "creates a new article associated with the author and magazine" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Magazine A", "Category A")
      article = author.add_article(magazine, "New Article")
      expect(article.author).to eq(author)
      expect(article.magazine).to eq(magazine)
      expect(article.title).to eq("New Article")
    end
  end

  describe "#topic_areas" do
    it "returns a unique array of categories of magazines the author has contributed to" do
      author = Author.new("John Doe")
      magazine1 = Magazine.new("Magazine A", "Category A")
      magazine2 = Magazine.new("Magazine B", "Category B")
      Article.new(author, magazine1, "Article 1")
      Article.new(author, magazine2, "Article 2")
      Article.new(author, magazine1, "Article 3")
      expect(author.topic_areas).to eq(["Category A", "Category B"])
    end
  end
end


# require_relative '../magazine'
require_relative '../solution'

RSpec.describe Magazine do
  describe "#initialize" do
    it "creates a new magazine with a name and category" do
      magazine = Magazine.new("Magazine A", "Category A")
      expect(magazine.name).to eq("Magazine A")
      expect(magazine.category).to eq("Category A")
    end
  end

  describe "#all" do
    it "returns an array of all magazine instances" do
      magazine1 = Magazine.new("Magazine A", "Category A")
      magazine2 = Magazine.new("Magazine B", "Category B")
      expect(Magazine.all).to eq([magazine1, magazine2])
    end
  end

  describe "#find_by_name" do
    it "returns the first magazine object that matches the given name" do
      magazine1 = Magazine.new("Magazine A", "Category A")
      magazine2 = Magazine.new("Magazine B", "Category B")
      expect(Magazine.find_by_name("Magazine B")).to eq(magazine2)
    end
  end

  describe "#article_titles" do
    it "returns an array of titles of articles written for the magazine" do
      magazine = Magazine.new("Magazine A", "Category A")
      article1 = Article.new(Author.new("John Doe"), magazine, "Article 1")
      article2 = Article.new(Author.new("Jane Smith"), magazine, "Article 2")
      expect(magazine.article_titles).to eq(["Article 1", "Article 2"])
    end
  end

  describe "#contributing_authors" do
    it "returns an array of authors who have written more than 2 articles for the magazine" do
      magazine = Magazine.new("Magazine A", "Category A")
      author1 = Author.new("John Doe")
      author2 = Author.new("Jane Smith")
      author3 = Author.new("Bob Johnson")
      Article.new(author1, magazine, "Article 1")
      Article.new(author1, magazine, "Article 2")
      Article.new(author2, magazine, "Article 3")
      Article.new(author2, magazine, "Article 4")
      Article.new(author2, magazine, "Article 5")
      Article.new(author3, magazine, "Article 6")
      expect(magazine.contributing_authors).to eq([author1, author2])
    end
  end
end

# require_relative '../article'
require_relative '../solution'

RSpec.describe Article do
  describe "#initialize" do
    it "creates a new article with an author, magazine, and title" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Magazine A", "Category A")
      article = Article.new(author, magazine, "New Article")
      expect(article.author).to eq(author)
      expect(article.magazine).to eq(magazine)
      expect(article.title).to eq("New Article")
    end
  end

  describe "#all" do
    it "returns an array of all article instances" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Magazine A", "Category A")
      article1 = Article.new(author, magazine, "Article 1")
      article2 = Article.new(author, magazine, "Article 2")
      expect(Article.all).to eq([article1, article2])
    end
  end
end






### DO NOT REMOVE THIS
binding.pry

0
