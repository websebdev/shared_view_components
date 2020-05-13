class DataTableComponent < ApplicationComponent
  def initialize(columns:, records:)
    @columns = columns
    @records = records
  end

  def column_header(column)
    previous_params = params.reject { |k, v| ["controller", "action"].include? k }

    title = column[:title] || column[:name].to_s.titleize(keep_id_suffix: true)

    if column[:sortable] && params[:sort_by] == column[:name] && ["asc", "desc"].include?(params[:sort_direction])
      if params[:sort_direction] == "asc"
        arrow = "↑"
        new_direction = :desc
      else
        arrow = "↓"
        new_direction = :asc
      end

      link_to "#{title} #{arrow}", Rails.application.routes.url_helpers.public_send("#{@records.klass.name.downcase.pluralize}_path", params: previous_params.merge({ sort_by: column[:name], sort_direction: new_direction }))
    elsif column[:sortable]
      link_to title, Rails.application.routes.url_helpers.public_send("#{@records.klass.name.downcase.pluralize}_path", previous_params.merge({ sort_by: column[:name], sort_direction: :asc }))
    else
      title
    end
  end
end
