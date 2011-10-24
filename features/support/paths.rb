module NavigationHelpers
  module Refinery
    module ResourceGuides
      def path_to(page_name)
        case page_name
        when /the list of resource_guides/
          admin_resource_guides_path

         when /the new resource_guide form/
          new_admin_resource_guide_path
        when /the list of guide_authors/
          admin_guide_authors_path

         when /the new guide_author form/
          new_admin_guide_author_path
        when /the list of guide_categories/
          admin_guide_categories_path

         when /the new guide_category form/
          new_admin_guide_category_path
        else
          nil
        end
      end
    end
  end
end
