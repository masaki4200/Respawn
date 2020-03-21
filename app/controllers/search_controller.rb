class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end

  private
  # 完全一致
  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'item'
      Item.where(title: content)
    end
  end

  def forward(model, content)
  	# 前方一致
    if model == 'user'
      User.where("name LIKE ?", "#{content}%")
    elsif model == 'item'
      Item.where("title LIKE ?", "#{content}%")
    end
  end

  def backward(model, content)
  	# 後方一致
    if model == 'user'
      User.where("name LIKE ?", "%#{content}")
    elsif model == 'item'
      Item.where("title LIKE ?", "%#{content}")
    end
  end

  def partical(model, content)
  	# 部分一致
    if model == 'user'
      User.where("name LIKE ?", "%#{content}%")
    elsif model == 'item'
      Item.where("title LIKE ?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end
