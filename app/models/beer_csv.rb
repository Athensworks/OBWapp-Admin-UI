require 'csv'

class BeerCsv
  def self.convert_save(csv_file)
    Beer.transaction do
      CSV.parse(csv_file.read, headers: true, header_converters: :symbol) do |row|
        beer = Beer.find_or_initialize_by(id: row[:id])

        updated_beer_data = row.to_hash.slice(:name, :ibu, :abv, :limited_release, :description, :untapped_url, :created_at, :brewery_id, :updated_at)
        updated_beer_data[:brewery_id] ||= Brewery.find_by(name: row[:brewery]).try(:id)

        beer.update_attributes!(updated_beer_data)

        # Create Status objects based on row[:locations]
        locations = row[:locations] || ""
        establishment_names = locations.split(",").map(&:strip)
        Establishment.where(name: establishment_names).pluck(:id).each do |establishment_id|
          Status.find_or_create_by(establishment_id: establishment_id, beer_id: beer.id) do |s|
            s.status = Status.status_options["Untapped"]
          end
        end
      end
    end

  end
end
