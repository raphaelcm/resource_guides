class GuideAuthorsController < ApplicationController

  before_filter :find_all_guide_authors
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @guide_author in the line below:
    present(@guide_author)
  end

  def show
    @guide_author = GuideAuthor.find(params[:id])
    if !params[:page].blank? && params[:page].to_i == 1
      return permanent_redirect_to(guide_author_url(@guide_author))
    end

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @guide_author in the line below:
    present(@guide_author)
  end

protected

  def find_all_guide_authors
    @guide_authors = GuideAuthor.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/guide_authors").first
  end

end
