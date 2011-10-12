module ResourceGuidesHelper
  
  # Which Nav Tab to highlight?
  def nav_tab
    if @resource_guide
      nav_tab_from_audience_type
    else
      request.fullpath == "/guides/student" ? :students : :employers
    end
  end
  
  def nav_tab_from_audience_type
    if @resource_guide.student?
      :students
    elsif @resource_guide.employer?
      :employers
    else
      logger.warn("Couldn't determine Nav Tab for #{@resource_guide.inspect}.")
      logger.warn("Detaulting to :students, but this is probably bad.")
      :students
    end
  end
  
  def featured_resources
    #page = index
    #featured = page.children.live.in_menu # Only live siblings with "show in menu" checked
    nil
  end
  
  def latest_resources(num)
    #page = index
    #featured = page.children.live.sort_by(&:created_at).take(num) # Get the N most recent resources
    nil
  end
end