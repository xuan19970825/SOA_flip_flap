# Module that can be included (mixin) to take and output Yaml data

module YamlBubby
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_yaml(yaml)
    @data = ''
    survey = YAML.safe_load(yaml)
    first_hash = survey[0]
    keys_array = first_hash.keys
    @data << keys_array.join("\t")
    @data << "\n"
    survey.each do |record|
      @data << record.values.join("\t")
      @data << "\n"
    end
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_yaml
    survey = []
    keys = @data[0].split("\t")
    keys.map!(&:chomp)
    @data.shift
    @data.each do |line|
      values = line.split("\t")
      record = {}
      keys.each_index { |index| record[keys[index]] = values[index].chomp }
      survey.push(record)
    end
    survey.to_yaml
  end
end
