# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_tsv(tsv)
    @data = []
    tsv.each_line { |line| @data << line }
    @data = split
    @data
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

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = [@data[0].keys.join("\t")]

    @data.each_with_object(tsv) do |data, arr|
      arr << data.values.join("\t")
    end

    tsv << ''
    tsv.join("\n")
  end
end
