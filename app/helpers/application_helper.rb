module ApplicationHelper

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
      base_title = "Clean Blog"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end

    # Returns the heading for a page.
    def full_heading(page_heading = '')
      if !page_heading.empty?
        page_heading
      else
        "No Page Heading"
      end
    end

    # Returns the dub-heading for a page.
    def full_sub_heading(page_sub_heading = '')
      if !page_sub_heading.empty?
        page_sub_heading
      else
        "No Sub Page Heading"
      end
    end

    # Returns the background image for a page.
    def full_bg_image(page_bg_image = '')
      if !page_bg_image.empty? && Rails.application.assets.find_asset(page_bg_image)
        '/assets/' + page_bg_image
      elsif !page_bg_image.empty?
        '/assets/default-post-bg.jpg' 
      else
        '/assets/default-post-bg.jpg' 
      end
    end
  end