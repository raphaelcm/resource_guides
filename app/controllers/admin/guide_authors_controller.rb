module Admin
  class GuideAuthorsController < Admin::BaseController

    crudify :guide_author,
            :title_attribute => 'name', :xhr_paging => true

  end
end
