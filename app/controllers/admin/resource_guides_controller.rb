module Admin
  class ResourceGuidesController < Admin::BaseController

    crudify :resource_guide, :paging => true

  end
end
