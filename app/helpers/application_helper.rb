module ApplicationHelper
  def feather(name, options = {})
    icon_name = name
    width     = options[:width] || 16
    height    = options[:height] || 16
    classes   = options[:classes] || []
    classes  += ['v-mid']

    content_tag :i, nil,
                    width: width,
                    height: height,
                    class: classes,
                    data: { feather: icon_name }
  end
end
