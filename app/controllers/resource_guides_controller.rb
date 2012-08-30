class ResourceGuidesController < ApplicationController
  include ControllerNavigation 
  main_navigation :guides

  #before_filter :find_all_resource_guides
  before_filter :find_page

  def index_employer
    @audience = :employers
    @resource_guides = ResourceGuide.for_audience(@audience.to_s)
    render "resource_guides/index"
  end
  
  def index_student
    @audience = :students
    @resource_guides = ResourceGuide.for_audience(@audience.to_s)
    render "resource_guides/index"
  end
  
  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_guide in the line below:
    present(@resource_guide)
  end

  def show
    @resource_guide = ResourceGuide.find(params[:id])
    @audience = @resource_guide.audience.to_sym
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_guide in the line below:
    #present(@resource_guide)
  end

protected

  def find_all_resource_guides
    @resource_guides = ResourceGuide.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/resource_guides").first
  end

end
