# frozen_string_literal: true

# Module that can be included (mixin) to take and output Yaml data

module YamlBubby
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_yaml
    @data.to_yaml
  end
end
