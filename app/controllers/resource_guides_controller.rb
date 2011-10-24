class ResourceGuidesController < ApplicationController

  before_filter :find_all_resource_guides
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_guide in the line below:
    present(@resource_guide)
  end

  def show
    @resource_guide = ResourceGuide.find(params[:id])
    @same_audience = ResourceGuide.same_audience_type(@resource_guide.audience_type)
    @next = @same_audience.next(@resource_guide.id).first
    @prev = @same_audience.previous(@resource_guide.id).first
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_guide in the line below:
    present(@resource_guide)
  end

protected

  def find_all_resource_guides
    @resource_guides = ResourceGuide.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/resource_guides").first
  end

end
