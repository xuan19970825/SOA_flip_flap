# Module that can be included (mixin) to take and output Yaml data

module YamlBubby
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_yaml(yaml)
    @data = ''
    survey = YAML.safe_load(yaml)
    join(survey)
    @data
  end

  def join(survey)
    join_key(survey)
    survey.each do |record|
      @data << record.values.join("\t")
      @data << "\n"
    end
  end

  def join_key(survey)
    keys_array = survey[0].keys
    @data << keys_array.join("\t")
    @data << "\n"
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_yaml
    split.to_yaml
  end

  def split
    keys = prepare_key
    @data.shift
    survey = []
    @data.each do |line|
      survey.push(split_line_by(line, keys))
    end
    survey
  end

  def prepare_key
    @data[0].split("\t").map!(&:chomp)
  end

  def split_line_by(line, keys)
    values = line.split("\t")
    record = {}
    keys.each_index { |index| record[keys[index]] = values[index].chomp }
    record
  end
end
