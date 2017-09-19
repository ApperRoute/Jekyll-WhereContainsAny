# Copyright 2017 James Kearney
# Released under the GNU General Public License V3 (see LICENSE)
#

module WhereContainsAny

  def where_contains_any(source, field, criteria)
    # source: an array of hashes to be searched (e.g. "site.data.someitems")
    # field: the hash key for the field to be searched. Expected to be a CSV list -- whitespace between elements is stripped (e.g. "ruby, jekyll, programming")
    # criteria: comma-separated list of tags to search for (e.g. "ruby, programming")

    criteria_arr = criteria.split ","
    for criterion in criteria_arr do criterion.strip!
    end

    subset = [];
    for item in source
      tags_arr = item[field].split(",")
      for tag in tags_arr do tag.strip!
      end
      for criterion in criteria_arr
        if tags_arr.any? { |tag| tag == criterion }
          subset << item
        end
      end
    end
    return subset
  end
end

Liquid::Template.register_filter(WhereContainsAny)
