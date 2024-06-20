module ApplicationHelper

  #ページタイトルが定義されていない場合は、base_titleを出力する
  def full_title(page_title = '')
    base_title = "基本情報フィードバックサイトFE_FD"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
