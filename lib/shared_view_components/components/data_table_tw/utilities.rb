# frozen_string_literal: true

require "rails/generators"

module SharedViewComponents::DataTableUtilities
  def self.sort(records:, columns:, params:)
    column = columns.find { |c| c[:name] == params[:sort_by] }
    if column && column[:sortable] && ["asc", "desc"].include?(params[:sort_direction])
      sort_by = if column[:table]
        "#{column[:table]}.#{column[:name]}"
      else
        "subscriptions.#{column[:name]}"
      end
      records.order("#{sort_by} #{params[:sort_direction]}")
    else
      records
    end
  end

  def self.filter(records:, columns:, params:)
    columns.each do |column|
      value = params[column[:name]]

      if value.present?
        table = column[:table] || "subscriptions"

        if column[:type] == "boolean"
          condition = "="
          search = value == "Yes"
        else
          condition = "ILIKE"
          search = "%#{value}%"
        end

        records = records.where("#{table}.#{column[:name]} #{condition} ?", search)
      end
    end

    records
  end
end