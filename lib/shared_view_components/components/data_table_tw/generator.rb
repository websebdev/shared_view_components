# frozen_string_literal: true

require "rails/generators"
require_relative "utilities"

class SharedViewComponents::DataTableTW < Rails::Generators::Base
  source_root __dir__

  argument :name, type: :string, optional: true, default: "DataTable"

  COMPONENTS_BASE_PATH = "app/components"

  def create_erb_file
    get "component.html.erb", File.join(COMPONENTS_BASE_PATH, "#{name}.html.erb")
  end

  def create_rb_file
    get "component.rb", File.join(COMPONENTS_BASE_PATH, "#{name}.rb")
  end
end