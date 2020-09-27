module PunkConcerts::Cell
  class Navigation < Trailblazer::Cell
    LANGUAGES = [
      { language: 'Deutsch', locale: 'de', flag: 'flags/germany.svg' },
      { language: 'English', locale: 'en', flag: 'flags/england.svg' },
    ].freeze

    def switch_locale
      actual_locale_data = LANGUAGES.find { |language| language[:locale] == I18n.locale.to_s }
      content_tag(:div, class: 'locale-switcher') do
        out =''
        out.concat(content_tag(:button, class: 'btn btn-light', data: { toggle: 'dropdown' }) do
          inner = ''
          inner.concat image_tag(actual_locale_data[:flag], width: '15', height: '15')
          inner.concat content_tag(:span, actual_locale_data[:locale].upcase, class: 'country-flag')
          inner.concat content_tag(:i, 'arrow_drop_down', class: 'material-icons')
        end)
        out.concat(content_tag(:ul, class: 'dropdown-menu') do
          LANGUAGES.map do |language|
            content_tag(:li) do
              link_to("/#{language[:locale]}") do
                inner = ''
                inner.concat image_tag(language[:flag], width: '15', height: '15')
                inner.concat content_tag(:p, language[:language])
              end
            end
          end.join
        end)
      end
    end
  end
end