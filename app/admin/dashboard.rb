ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Overall Stats" do
          ul do
            li "Total Establishments: #{Establishment.count}"
            li "Total Beers: #{Beer.count}"
            li "Tasted Beers: #{Like.tasted.count}"
            li "Favorited Beers: #{Like.favorited.count}"
          end
        end
        
        panel "User Stats" do
          li "Total unique users: #{Like.select(:device_guid).distinct.count}"

          (2..9).map do |multiplier|
            beginning = multiplier * 10
            ending    = beginning + 9
            li "Users between #{beginning} and #{ending}: #{ Like.where(age: beginning..ending).select(:device_guid).distinct.count }"
          end.join
        end

        panel "Beer Status" do
          ul do
            li link_to "Total Untapped Beers: #{Status.untapped.count}", admin_statuses_path(scope: 'untapped')
            li link_to "Total Tapped Beers: #{Status.tapped.count}", admin_statuses_path(scope: 'tapped')
            li link_to "Total Empty Beers: #{Status.empty.count}", admin_statuses_path(scope: 'empty')
            li link_to "Total Empty Reported Beers: #{Status.empty_reported.count}", admin_statuses_path(scope: 'empty_reported')
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
