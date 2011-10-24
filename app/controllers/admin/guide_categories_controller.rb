module Admin
  class GuideCategoriesController < Admin::BaseController

    crudify :guide_category,
            :title_attribute => 'name', :xhr_paging => true

  end
end
